# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Returns true if a test user is logged in.
    def logged_in?
      !session[:user_id].nil?
    end

    # Log in as a particular user.
    def log_in_as(user)
      session[:user_id] = user.id
    end
  end
end

module ActionDispatch
  class IntegrationTest
    # Log in as a particular user.
    def log_in_as(user, password: 'password')
      post login_path, params: { session: { email: user.email,
                                            password: password } }
    end
  end
end
