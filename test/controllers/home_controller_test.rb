require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    log_in users(:with_password)
    get root_url
    assert_response :ok
    assert_select "title", I18n.t(:app_name)
    assert_select "h2", "Welcome to #{I18n.t :app_name}!"
  end

  test "should not get index if not logged in" do
    get root_url
    assert_redirected_to login_url
  end
end
