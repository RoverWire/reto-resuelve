require 'rubygems'
require 'rack/test'
require 'airborne'
require_relative '../config/enviroment'
require_relative './helpers'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended.
    mocks.verify_partial_doubles = true
  end

  # Inlcude Helpers
  config.include Helpers
end

# Initialize Airborne to perform API requests.
Airborne.configure do |config|
  config.rack_app = API::Root
end
