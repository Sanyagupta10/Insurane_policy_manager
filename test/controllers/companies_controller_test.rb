require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get redirected when not logged in" do
    get login_path
    assert_response :success
  end
  test "should redirect index when not logged in" do
    get companies_path
    assert_redirected_to login_url
  end
end
