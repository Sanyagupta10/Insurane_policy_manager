# frozen_string_literal: true

require 'test_helper'

class PolicytypesControllerTest < ActionDispatch::IntegrationTest
  test 'should get redirected when not logged in' do
    get login_path
    assert_response :success
  end
  test 'should redirect index when not logged in' do
    get policytypes_path
    assert_redirected_to login_url
  end
end
