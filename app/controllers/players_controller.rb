class PlayersController < ApplicationController

before_filter :login_required, only: [:new, :create, :edit, :destroy]
before_action :set_player, only: [:edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update, :destroy] 

def index
 @team = Team.find(params[:team_id])
 
 @players = @team.players

end

def show
  @player = Player.find(params[:id])
  @team = @player.team
end

def new
 @team = Team.find(params[:team_id])
 if @team.user_id == current_user.id 
   @player = @team.players.new
 else
   redirect_to team_players_url(@team)
 end
end

def create
 @team = Team.find(params[:team_id])
 @player = @team.players.new(player_params)
 @player.user_id = current_user.id

 if @player.save
   redirect_to team_players_url(@team)
   flash[:notice] = "Player was succesfully created!"
 else
   render :new
 end
end

def edit
  #@team = Team.find(params[:team_id])
  #@team = @player.team
  #if @team.user_id != current_user.id
  #  redirect_to team_player_path(@team)
  #end 
end

def update
  if @player.update(player_params)
    redirect_to team_players_url(@player.team)
    flash[:notice] = "Player was succesfully updated!"
  else
    render :edit
  end
end

def destroy
  @player.destroy
  redirect_to team_players_url(@player.team), alert: "Player was deleted!"
end


private

 def set_player
   @player = Player.find(params[:id])
 end

 def player_params
   params.require(:player).permit(:first, :last, :hits, :assists, :atbats, :batavg, :runs, :singles, :doubles, :triples, :homeRuns, :rbis, :stolenBases, :caughtStealing, :walks, :strikeouts, :hitByPitch, :sacrificeHits, :sacrificeFlies, :plateAppearances, :onBasePercentage, :sluggingPercentage, :caughtStealingPercentage, :putouts, :outfieldAssists, :infieldAssists, :f_errors, :assists, :defensiveChances, :fieldingPercentage, :passedBalls, :f_stolenBases, :f_caughtStealing, :f_caughtStealingPercentage, :wins, :losses, :earnedRuns, :inningsPitched, :gamesStarted, :completeGames, :shutouts, :saves, :p_hits, :p_runs, :p_homeRuns, :p_walks, :p_strikeouts, :p_hitByPitch, :balks, :wildPitches, :earnedRunAverage, :whip, :h9, :hr9, :bb9, :k9)
 end

 def login_required
   redirect_to login_path unless logged_in?
 end

 def correct_user
   #user = User.find(params[:id])
   #@team = Team.find(params[:id])

   user = User.find(params[:id])
  
   @player = Player.find(params[:id])
   #if !@player.team.nil?
     #@team = @player.team
     #@team = Team.find(params[:team_id])
     #user = User.find(params[:user_id])

     #redirect_to team_players_url(@team) unless @team.user_id == current_user.id && @team.user_id == @player.user_id && current_user.id == @player.user_id
     redirect_to(teams_url) unless @player.user_id == current_user.id
   end
     
 end


