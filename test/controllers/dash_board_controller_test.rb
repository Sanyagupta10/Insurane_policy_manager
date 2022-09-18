require 'test_helper'

class DashBoardControllerTest < ActionDispatch::IntegrationTest
  test 'should get redirected when not logged in' do
    get login_path
    assert_response :success
  end
end
