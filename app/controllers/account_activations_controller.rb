class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && user.authenticated?(:activation, params[:id])
      #activate the user
    else
      #invalid activation link
    end

  end
end
