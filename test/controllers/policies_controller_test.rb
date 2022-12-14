# frozen_string_literal: true

require 'test_helper'

class PoliciesControllerTest < ActionDispatch::IntegrationTest
  test 'should get redirected when not logged in' do
    get login_path
    assert_response :success
  end
  test 'should redirect index when not logged in' do
    get policies_path
    assert_redirected_to login_url
  end
  # test 'should redirect edit when not logged in' do
  #   get edit_policy_path
  #   assert_redirected_to login_url
  # end
end
