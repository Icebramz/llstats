class PlaysController < ApplicationController
 before_action :set_play, only: [:edit, :update, :destroy]
 before_filter :login_required, only: [:new, :create, :edit, :update, :destroy]
 #before_action :set_play, only: [:edit, :update, :destroy]
 before_action :correct_user, only: [:edit, :update, :destroy]

 def new
  @game = Game.find(params[:game_id])

  if @game.user_id == current_user.id 
    @play = @game.plays.new
  elsif @game.user_id != current_user.id
    redirect_to @game
  end
 end

 def edit
 end

 def create
  @game = Game.find(params[:game_id])
  @play = @game.plays.new(play_params)
    #@play.user_id = current_user.id

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
  
  def login_required
    redirect_to login_path unless logged_in?
  end

  def correct_user
   @play = Play.find(params[:id])
    redirect_to @play.game unless @play.game.user_id == current_user.id
    #redirect_to @game unless @play.game_id == current_user.game_id
  end

  def set_play
   @play = Play.find(params[:id])
  end

 def play_params
  params.require(:play).permit(:inning, :player_name, :home_away, :message, :balls, :strikes, :out)
 end

end
