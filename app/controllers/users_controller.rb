class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
   @users = User.where(activated: true). paginate(page: params[:page])
   # unless logged_in?
   #   flash[:danger] = "Please log in"
   #   redirect_to login_url
   # end
   # @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    #use find method on User model to retrieve user from DB; params retrieves user id
    #debugger <--uncomment debugger for debugging purposes via terminal
  end


  def new
    @user = User.new
  end


  def create
	@user = User.new(user_params)
    if @user.save
       @user.send_activation_email 
       flash[:info] = "Please check your email to activate your account."
       redirect_to root_url 
    else
       render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy #method chaining combines find & destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
    
    def user_params #want this private s.t. it's not exposed to external users via web
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #before filters

    #confirms a logged-in user
    def logged_in_user
      unless logged_in?
        store_location #this is defined in sessions_helper.rb
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    #confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    #confirms an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
