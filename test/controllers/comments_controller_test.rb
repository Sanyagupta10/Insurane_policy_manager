require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get redirected when not logged in" do
    get login_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get comments_path
    assert_redirected_to login_url
  end
end
