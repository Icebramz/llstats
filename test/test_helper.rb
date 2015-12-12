ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

module SignInHelper
  def sign_in(user)
    session[:user_id] = user.id
  end
end


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include SignInHelper


  # Returns true if a test user is logged in
  def is_logged_in?
    !session[:user_id].nil?
  end


  # Logs in a test user
  def log_in_as(user, options = {}) 
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    #the above evals to given option if present ^ to default o.w. (reason bc hashes retrn "nil" for nonexistent keys
    if integration_test?
 	  post login_path, session: { email: user.email, password: password, remember_me: remember_me }
    else
      session[:user_id] = user.id
    end
  end

  private

     # Returns true inside an integration test.
     def integration_test?
       defined?(post_via_redirect)
     end


end
