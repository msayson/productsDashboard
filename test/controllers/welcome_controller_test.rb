require 'test_helper'

# Tests for starting welcome page
class WelcomeControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end
end
