class TeamsController < ApplicationController
 before_filter :login_required, only: [:new, :create, :edit, :destroy]

 #GET /teams
 def index
  @teams = Team.all
 end

 def show
  @team = Team.find(params[:id])
 end

 def new
  @team = Team.new
 end

 def create
  #@team = Team.new(params.require(:team).permit(:name, :division, :avatar))
  @team = current_user.teams.build(team_params)
  if @team.save
   redirect_to @team
   flash[:notice] = "Team has succesfully been added!"
  else
   render :new
  end
 end

 def edit
  @team = Team.find(params[:id])
 end

 def update
  @team = Team.find(params[:id])
  if @team.update(params.require(:team).permit(:name, :division, :avatar))
    redirect_to @team
    flash[:notice] = "Team has been succesfully updated!"
  else
   render :edit
  end
 end

 def destroy
  @team = Team.find(params[:id])
  @team.destroy
   redirect_to teams_url
   flash[:notice] = "Team has been succesfully removed!"
 end

  private
  
    def login_required
      redirect_to login_path unless logged_in?
    end
   
    def team_params
      params.require(:team).permit(:name, :division, :avatar)
    end

end
