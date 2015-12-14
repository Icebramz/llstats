class TeamsController < ApplicationController
 before_filter :login_required, only: [:new, :create, :edit, :destroy]
 before_action :set_team, only: [:edit, :update, :destroy]
 before_action :correct_user, only: [:edit, :update, :destroy]

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
   flash[:notice] = "Team has succesfully been added!"
   redirect_to @team
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
    flash[:notice] = "Team has been succesfully updated!"
    redirect_to @team
    #flash[:notice] = "Team has been succesfully updated!"
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
  
    def set_team
      @team = Team.find(params[:id])
    end

    def login_required
      redirect_to login_path unless logged_in?
    end
   
    def team_params
      params.require(:team).permit(:name, :division, :avatar)
    end
  
    def correct_user
      #user = User.find(params[:id])
#      @team = Team.find(params[:id])
      if !current_user.nil?
        @team = current_user.teams.find_by(id: params[:id])
        #redirect_to(teams_url) unless @team.user_id == current_user.id
        redirect_to(teams_url) if @team.nil?
      end

      #redirect_to @team unless @team.user_id == current_user.id
    end

end
