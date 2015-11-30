module SessionsHelper
  
  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
    #tmp. cookie created by session method expires immediately when browser is closed
  end

  def remember(user) #user logging in remembered in sense that their browser will get a valid remember token
    user.remember #this generates a remember token & saves its digest to DB
	cookies.permanent.signed[:user_id] = user.id 
 	#cookies is used to create permanent cookies for user id & remember token
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user?(user)
    user == current_user
  end

  #returns user corresponding to the remember token cookie
  def current_user
    if(user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif(user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  #the above method logs user out of a session in Chrome, IE, etc.


  def logged_in?
    !current_user.nil? #a user=logged in if there's a current user in session (i.e. current_user is not nil
  end


  #forgets a persistent or continuous session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end


  # Logs out the current user; log_out method definition
  def log_out
    forget(current_user)
    session.delete(:user_id) #removes the forwarding URL
    @current_user = nil
  end

  #redirects to stored location (or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default) #any code after a redirect still gets executed until an explicit return or the end of the methodd
    session.delete(:forwarding_url)
  end

  #stores the URL trying to be accessed
  def store_location
	session[:forwarding_url] = request.url if request.get?
  end

end
