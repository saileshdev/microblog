module SessionsHelper

  # logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  # remeber a user in persistent sessions
  def remember(user)
    user.remember
    # set the cookies
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent.signed[:remember_token] = user.remember_token
  end

  #returns the current logged-in user
  def current_user
    if session[:user_id]
      #if sessions still exists case
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      # if the session is lost, but persistent cookies still exist case
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # returns true, if the user is logged in
  def logged_in?
    !current_user.nil?
  end

  # logout the user
  def log_out
    session[:user_id] = nil
    # or we can do, session.delete(:user_id)
    @current_user = nil
  end

end
