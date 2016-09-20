require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  
  def setup
    @microposts = microposts(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference "Micropost.count" do
       post :create, micropost: {content: "Lorem ipsum"}
    end
    assert_redirected_to root_url 
  end

end
