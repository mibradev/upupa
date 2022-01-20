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

  test "should show role" do
    get role_url(@role)
    assert_response :ok
  end

  class AuthorizationTest < ActionDispatch::IntegrationTest
    setup do
      log_in users(:with_password)
    end

    test "should not get index" do
      get roles_url
      assert_response :forbidden
    end

    test "should not show role" do
      get role_url(1)
      assert_response :forbidden
    end
  end
end
