require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get login_with_CAS" do
    get :login_with_CAS
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

end
