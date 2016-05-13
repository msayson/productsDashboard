ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Helper methods accessible by all tests
class ActiveSupport::TestCase
  # Set up all fixtures in test/fixtures/*.yml
  # in alphabetical order.
  fixtures :all
end
