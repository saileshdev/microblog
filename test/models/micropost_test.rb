require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
  test "should be valid" do
    assert @micropost.valid?
  end


end
