ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # Returns true if a test user is logged in. 
  def is_logged_in? 
    !session[:member_id].nil? 
  end
  
  # Log in as a particular user. 
  def log_in_as(member) 
    session[:member_id] = member.id 
  end

  # Add more helper methods to be used by all tests here...
  include ApplicationHelper
end

class ActionDispatch::IntegrationTest 
  # Log in as a particular user. 
  def log_in_as(member, password: 'Password_1', remember_me: '1') 
    post log_in_path, params: { session: { user_name: member.user_name,
                                          password: password, 
                                          remember_me: remember_me } }
  end
end
