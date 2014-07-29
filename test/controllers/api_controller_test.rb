require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get documentation_methods" do
    get :documentation_methods
    assert_response :success
  end

end
