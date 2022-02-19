require "test_helper"

class Users::RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in users(:admin)
    @user = users(:for_role_assignment_one)
  end

  test "should create role_assignment" do
    assert_difference("@user.role_assignments.count") do
      post user_roles_url(@user), params: {role_assignment: {role_id: roles(:one).id}}
    end

    assert_redirected_to user_url(@user)
  end

  test "should not create role_assignment with invalid parameters" do
    post user_roles_url(@user), params: {role_assignment: {role_id: nil}}
    assert_redirected_to user_url(@user)
  end

  test "should destroy role_assignment" do
    assert_difference("@user.role_assignments.count", -1) do
      delete user_role_url(@user, @user.roles.first)
    end

    assert_redirected_to user_url(@user)
  end

  class AuthorizationTest < ActionDispatch::IntegrationTest
    setup do
      log_in users(:with_password)
    end

    test "should not create role_assignment" do
      post user_roles_url(1)
      assert_response :forbidden
    end

    test "should not destroy role_assignment" do
      delete user_role_url(1, 1)
      assert_response :forbidden
    end
  end
end
