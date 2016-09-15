require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:valid_user)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user.id
    assert_redirected_to login_url
  end

end
