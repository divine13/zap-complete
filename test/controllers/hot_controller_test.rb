require 'test_helper'

class HotControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
