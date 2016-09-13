require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    before_count = User.count
    
    post users_path, user: {name: "",email: "user@invalid", password: "foo", password_confirmation: "bar"}
    after_count = User.count
    assert_equal before_count, after_count
    assert_template "users/new"  
  end
end
