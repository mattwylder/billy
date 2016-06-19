require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get construction" do
    get :construction
    assert_response :success
  end

end
