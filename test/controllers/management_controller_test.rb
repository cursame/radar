require 'test_helper'

class ManagementControllerTest < ActionController::TestCase
  test "should get applications" do
    get :applications
    assert_response :success
  end

  test "should get hot_spots" do
    get :hot_spots
    assert_response :success
  end

  test "should get institutions" do
    get :institutions
    assert_response :success
  end

end
