ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:user_id].nil?
  end

  # returns true if a test user is logged in
  def log_in_as(user,options = {})    
    #by default remember me is set to 1
    remember_me = options[:remember_me] || "1"
    password = options[:password] || "password"

    if integration_test?
      post login_path, session: {email: user.email, password: password, remember_me: remember_me}
    else
      session[:user_id] = user.id
    end

  end

  private
    
    # returns true inside an integration test
    def integration_test?
      defined?(post_via_redirect)
    end
end
