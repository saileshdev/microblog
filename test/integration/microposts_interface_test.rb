require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:valid_user)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select "div.pagination"

    #invalid submission
    post microposts_path, micropost: {content: ""}
    assert_select "div#error_explanation"

    #valid submission
    content = "This is a valid micropost"
    assert_difference "Micropost.count", 1 do
      post microposts_path, micropost: {content: content}
    end
  end

end
