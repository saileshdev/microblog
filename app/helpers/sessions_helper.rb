module SessionsHelper

  # logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  #returns the current logged-in user
  def current_user
      @current_user || = User.find_by(id: sessions[:user_id])
  end
end
