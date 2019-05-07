require 'test_helper'

class ProjectUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get project_users_add_url
    assert_response :success
  end

  test "should get remove" do
    get project_users_remove_url
    assert_response :success
  end

end
