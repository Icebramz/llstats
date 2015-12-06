class GamesController < ApplicationController
before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
def index
 @games = Game.all
end

def show
 @game = Game.find(params[:id])
 
 @play = @game.plays.new
end

def new
 @game = Game.new
end

def create
 @game = Game.new(params.require(:game).permit(:hometeam_id, :awayteam_id, :home_inningone, :home_inningtwo, :home_inningthree, :home_inningfour, :home_inningfive, :home_inningsix, :home_inningseven, :home_inningeight, :home_inningnine, :home_runs, :home_hits, :home_error, :away_inningone, :away_inningtwo, :away_inningthree, :away_inningfour, :away_inningfive, :away_inningsix, :away_inningseven, :away_inningeight, :away_inningnine, :away_runs, :away_hits, :away_error))

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

#before_action :authenticate_user!

end
