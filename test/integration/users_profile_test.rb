require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:valid_user)
  end
 
  test "profile display" do
   get user_path(@user)
   assert_template 'users/show'

  assert_select 'title', "#{@user.name} | Microblog" 
  end

end
