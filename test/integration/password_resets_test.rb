require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  
  def setup
  #we are clearing the array before any test
  ActionMailer::Base.deliveries.clear
  #ActionMailer::Base.deliveries is an array and the length becomes 1 when a mail is sent 
  end

  
end
