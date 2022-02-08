require "test_helper"

class Users::RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in users(:admin)
    @user = users(:for_user_role_one)
  end

  test "should create user_role" do
    assert_difference("@user.user_roles.count") do
      post user_roles_url(@user), params: {user_role: {role_id: roles(:one).id}}
    end

    assert_redirected_to user_url(@user)
  end

  test "should not create user_role with invalid parameters" do
    post user_roles_url(@user), params: {user_role: {role_id: nil}}
    assert_redirected_to user_url(@user)
  end

  test "should destroy user_role" do
    assert_difference("@user.user_roles.count", -1) do
      delete user_role_url(@user, @user.roles.first)
    end

    assert_redirected_to user_url(@user)
  end

  class AuthorizationTest < ActionDispatch::IntegrationTest
    setup do
      log_in users(:with_password)
    end

    test "should not create user_role" do
      post user_roles_url(1)
      assert_response :forbidden
    end

    test "should not destroy user_role" do
      delete user_role_url(1, 1)
      assert_response :forbidden
    end
  end
end
