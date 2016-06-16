require 'test_helper'

class AstrologyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
