require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    log_in users(:with_password)
    get root_url
    assert_response :ok
    assert_select "title", I18n.t(:app_name)
    assert_select "h1", I18n.t(:app_name)
  end

  test "should not get index if not logged in" do
    get root_url
    assert_equal I18n.t("alerts.sessions.unauthenticated"), flash.alert
    assert_redirected_to login_url
  end
end
