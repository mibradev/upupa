require "test_helper"

class Users::RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in users(:with_password)
    @user = users(:one)
  end

  test "should create role" do
    assert_difference("@user.roles.count") do
      post user_roles_url(@user), params: {role: {role_id: roles(:one).id}}
    end

    assert_redirected_to @user
  end
end
