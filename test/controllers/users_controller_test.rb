require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:valid_user)
    @other_user = users(:second_user)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user.id
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user.id, user: {name: @user.name, email: @user.email}
    assert_redirected_to login_url
  end

  test "should redirect to edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert_redirected_to login_url
  end

end
