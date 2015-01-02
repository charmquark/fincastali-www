require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get heathenry" do
    get :heathenry
    assert_response :success
  end

end
