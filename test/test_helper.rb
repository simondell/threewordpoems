ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
MiniTest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:poet_id].nil?
  end

  def log_in_as poet
    session[:poet_id] = poet.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as poet, password: 'password', remember_me: '1'
    post login_path, params: {
      session: {
        email: poet.email,
        password: password,
        remember_me: remember_me
      }
    }
  end
end
