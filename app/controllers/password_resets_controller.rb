class PasswordResetsController < ApplicationController
  
  before_action :get_user, only: [:edit, :update]  

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

  def update
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired"
      redirect_to new_password_reset_url
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset"
      redirect_to @user
    else
      #render back the edit form
      render "edit"
    end 
  end

  private
  
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end
end
