require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  
  def setup
  #we are clearing the array before any test
  ActionMailer::Base.deliveries.clear
  #ActionMailer::Base.deliveries is an array and the length becomes 1 when a mail is sent 
  @user = users(:valid_user)
  end

  test "password resets" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    
    #invalid email not in db
    post password_resets_path, password_reset: {email: "invalid_email"}
    assert_not flash.empty?
    assert_template 'password_resets/new'

    #valid email
    post password_resets_path, password_reset: {email: @user.email}
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url

    #password reset form
    user = assigns(:user)
    
    #wrong email
    get edit_password_reset_path(user.reset_token, email:"invalid_email")
    assert_redirected_to root_url
    
    #inactive user
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to root_url
    user.toggle!(:activated)
      
  end
end
