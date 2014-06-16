require 'test_helper'

class StaticsViewsControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get panel" do
    get :panel
    assert_response :success
  end

end
