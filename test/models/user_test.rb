require 'test_helper'

class UserTest < ActiveSupport::TestCase
 
  def setup
  #this setup method runs before every test 
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end


  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email should accept valid formats" do
    valid_addresses = %w[user@example.com USER@example.COM A_US-EN@foo.bar.org 
    first.last@foo.jp mike+bob@baz.cn]
    
    valid_addresses.each do |valid_address|
       @user.email = valid_address
       assert @user.valid?
    end
  end



end
