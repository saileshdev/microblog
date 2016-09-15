require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:valid_user)
    @other_user = users(:second_user)
  end
  
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit" 
    patch user_path(@user), user: {name: "",email: "user@invalid", password: "foo", password_confirmation: "bar"}
    assert_template "users/edit" 
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template "users/edit" 
    name = "Foo Bar"
    email = "foo@bar.com"
    password = "password"
    patch user_path(@user), user: {name: name,email: email, password: password, password_confirmation: password}
    
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end

  test "should redirect to edit when logged in as wrong user" do
    log_in_as(@other_user)
  end
end
