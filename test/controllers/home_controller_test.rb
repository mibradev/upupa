require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    log_in users(:with_password)
    get root_url
    assert_response :ok
    assert_select "title", I18n.t(:app_name)
    assert_select "h1", "Welcome to #{I18n.t :app_name}!"
  end

  test "should not get index if not logged in" do
    get root_url
    assert_redirected_to login_url
  end

  test "should not cause too many redirects after destroying logged in user" do
    user = users(:with_password)
    log_in user
    user.destroy!
    get root_url
    follow_redirect!
    assert_response :ok
  end
end
