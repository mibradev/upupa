require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in users(:one)
    get root_url
    assert_response :ok
    assert_select "title", I18n.t(:app_name)
    assert_select "h2", "Welcome to #{I18n.t :app_name}!"
  end

  class UnauthenticatedTest < ActionDispatch::IntegrationTest
    teardown do
      assert_redirected_to new_user_session_url
    end

    test "should not get index" do
      get root_url
    end
  end
end
