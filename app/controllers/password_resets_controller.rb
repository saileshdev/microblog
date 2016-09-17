class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      #if email exists in db then create the digest
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      #when email isnt found in the database
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end
end
