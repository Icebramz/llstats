class PlayersController < ApplicationController

before_action :set_player, only: [:edit, :update, :destroy]


def index
 @team = Team.find(params[:team_id])
 
 @players = @team.players
end

def new
 @team = Team.find(params[:team_id])
 
 @player = @team.players.new
end

def create
 @team = Team.find(params[:team_id])
 @player = @team.players.new(player_params)

 if @player.save
   redirect_to team_players_url(@team), notice: 'Player was succesfully created!'
 else
   render :new
 end
end

def edit
end

def update
  if @player.update(player_params)
    redirect_to team_players_url(@player.team), notice: 'Player was succesfully updated!'
  else
    render :edit
  end
end

def destroy
  @player.destroy
  redirect_to team_players_url(@player.team), notice: "Player was deleted!"
end


private

 def set_player
   @player = Player.find(params[:id])
 end

 def player_params
   params.require(:player).permit(:first, :last, :hits, :assists, :atbats, :batavg, :runs, :singles, :doubles, :triples, :homeRuns, :rbis, :stolenBases, :caughtStealing, :walks, :strikeouts, :hitByPitch, :sacrificeHits, :sacrificeFlies, :plateAppearances, :onBasePercentage, :sluggingPercentage, :caughtStealingPercentage, :putouts, :outfieldAssists, :infieldAssists, :f_errors, :assists, :defensiveChances, :fieldingPercentage, :passedBalls, :f_stolenBases, :f_caughtStealing, :f_caughtStealingPercentage, :wins, :losses, :earnedRuns, :inningsPitched, :gamesStarted, :completeGames, :shutouts, :saves, :p_hits, :p_runs, :p_homeRuns, :p_walks, :p_strikeouts, :p_hitByPitch, :balks, :wildPitches, :earnedRunAverage, :whip, :h9, :hr9, :bb9, :k9)
 end

end

