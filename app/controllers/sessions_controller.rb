class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # log the user in and redirect the to the user's show page
      log_in user
      redirect_to user
    else
      # create an error message
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'

    end
  end

  def destroy
  end

end
