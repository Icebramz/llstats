class PlaysController < ApplicationController
 before_action :set_play, only: [:edit, :update, :destroy]

 def new
  @game = Game.find(params[:game_id])

  @play = @game.plays.new
 end

 def edit
 end

 def create
  @game = Game.find(params[:game_id])
  @play = @game.plays.new(play_params)

  if @play.save
    redirect_to game_url(@game), notice: "Play was successfully created"
  else
   render :new
  end 
 end

 def update
  if @play.update(play_params)
   redirect_to game_url(@play.game), notice: "Play was successfully updated"
  else
   render :edit
  end
 end

 def destroy
  @play.destroy
  redirect_to game_url(@play.game), notice: "Play was successfully destroyed"
 end

 private
  def set_play
   @play = Play.find(params[:id])
  end

 def play_params
  params.require(:play).permit(:inning, :player_name, :home_away, :message, :balls, :strikes, :out)
 end

end
