class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    #use find method on User model to retrieve user from DB; params retrieves user id
    #debugger <--uncomment debugger for debugging purposes via terminal
  end


  def new
    @user = User.new
  end


  def create
	@user = User.new(user_params)
    if @user.save
       log_in @user
       flash[:success] = "Welcome to the LL Stats App!"
       #redirect_to @user #redirect the newly created user's profile
       redirect_to user_url(@user) #this is equiv. to above
    else
       render 'new'
    end
  end


  private
    
    def user_params #want this private s.t. it's not exposed to external users via web
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
