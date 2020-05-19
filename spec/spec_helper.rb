require 'pry'
require 'airborne'
require_relative '../api/root'

ENV['RACK_ENV'] ||= 'test'

# Disable Ruby 2.7.1 deprecated warnings listed on
# https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/
Warning[:deprecated] = false

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
end

# Initialize Airborne to perform API requests.
Airborne.configure do |config|
  config.rack_app = API::Root
end
