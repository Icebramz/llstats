class GamesController < ApplicationController
before_filter :login_required, only: [:new, :create, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update, :destroy]

def index
 @games = Game.all
end

def show
# if !@game.nil?
   @game = Game.find(params[:id])
 
   @play = @game.plays.new
# end
end

def new
 @game = Game.new
end

def create
 @game = Game.new(game_params) 
 @game.user_id = current_user.id

 if @game.save
  redirect_to @game
 else
  render :new
 end
end

def edit
 @game = Game.find(params[:id])
end

def update
   @game = Game.find(params[:id])
   if @game.update(params.require(:game).permit(:hometeam_id, :awayteam_id, :home_inningone, :home_inningtwo, :home_inningthree, :home_inningfour, :home_inningfive, :home_inningsix, :home_inningseven, :home_inningeight, :home_inningnine, :home_runs, :home_hits, :home_error, :away_inningone, :away_inningtwo, :away_inningthree, :away_inningfour, :away_inningfive, :away_inningsix, :away_inningseven, :away_inningeight, :away_inningnine, :away_runs, :away_hits, :away_error))
    redirect_to @game
   else
    render :edit
   end
end

def destroy
 @game = Game.find(params[:id])
 @game.destroy 
  redirect_to games_url
end

  private

     def login_required
       redirect_to login_path unless logged_in?
     end   

     def game_params
       params.require(:game).permit(:hometeam_id, :awayteam_id, :home_inningone, :home_inningtwo, :home_inningthree, :home_inningfour, :home_inningfive, :home_inningsix, :home_inningseven, :home_inningeight, :home_inningnine, :home_runs, :home_hits, :home_error, :away_inningone, :away_inningtwo, :away_inningthree, :away_inningfour, :away_inningfive, :away_inningsix, :away_inningseven, :away_inningeight, :away_inningnine, :away_runs, :away_hits, :away_error)
     end
       
    def correct_user
      user = User.find(params[:id])
      @game = Game.find(params[:id])
      #redirect_to(games_url) unless @game.user_id == current_user.id
      redirect_to @game unless @game.user_id == current_user.id
    end

end
