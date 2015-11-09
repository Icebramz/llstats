module SessionsHelper
  
  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
    #tmp. cookie created by session method expires immediately when browser is closed
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # ||= means "or equals"; call to find_by only executed if @current_user hasn't been assigned yet
  end

  def logged_in?
    !current_user.nil? #a user=logged in if there's a current user in session (i.e. current_user is not nil
  end

  # Logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
