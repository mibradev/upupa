require "test_helper"

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in users(:admin)
    @role = roles(:one)
  end

  test "should get index" do
    get roles_url
    assert_response :ok
  end

  test "should get new" do
    get new_role_url
    assert_response :ok
  end

  test "should create role" do
    assert_difference("Role.count") do
      post roles_url, params: {role: {name: "new"}}
    end

    assert_redirected_to role_url(Role.last)
  end

  test "should show role" do
    get role_url(@role)
    assert_response :ok
  end

  test "should get edit" do
    get edit_role_url(@role)
    assert_response :ok
  end

  test "should update role" do
    patch role_url(@role), params: {role: {name: @role.name}}
    assert_redirected_to role_url(@role)
  end

  test "should destroy role" do
    assert_difference("Role.count", -1) do
      delete role_url(@role)
    end

    assert_redirected_to roles_url
  end

  class InvalidParametersTest < ActionDispatch::IntegrationTest
    setup do
      log_in users(:admin)
      @role = roles(:one)
    end

    test "should not create role" do
      post roles_url, params: {role: {name: nil}}
      assert_response :unprocessable_entity
    end

    test "should not update role" do
      patch role_url(@role), params: {role: {name: nil}}
      assert_response :unprocessable_entity
    end
  end

  class ForbiddenTest < ActionDispatch::IntegrationTest
    setup do
      log_in users(:with_password)
    end

    test "should not get index" do
      get roles_url
      assert_response :forbidden
    end

    test "should not get new" do
      get new_role_url
      assert_response :forbidden
    end

    test "should not create role" do
      post roles_url
      assert_response :forbidden
    end

    test "should not show role" do
      get role_url(1)
      assert_response :forbidden
    end

    test "should not get edit" do
      get edit_role_url(1)
      assert_response :forbidden
    end

    test "should not update role" do
      patch role_url(1)
      assert_response :forbidden
    end

    test "should not destroy role" do
      delete role_url(1)
      assert_response :forbidden
    end
  end
end
