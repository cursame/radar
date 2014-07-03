require 'test_helper'

class QuestionariesControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get biew" do
    get :biew
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
