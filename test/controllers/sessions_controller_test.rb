require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:with_password)
    @password = "12345678"
  end

  test "should get login" do
    get login_url
    assert_response :ok
  end

  test "should not get login if already logged in" do
    log_in @user
    get login_url
    assert_equal I18n.t("sessions.already_logged_in"), flash.alert
    assert_redirected_to root_url
  end

  test "should log in" do
    post login_url, params: {email: @user.email, password: @password}
    assert_equal @user.id, session[:user_id]
    assert_equal I18n.t("sessions.logged_in"), flash.notice
    assert_redirected_to root_url
  end

  test "should not log in if already logged in" do
    log_in @user
    post login_url, params: {email: @user.email, password: @password}
    assert_equal I18n.t("sessions.already_logged_in"), flash.alert
    assert_redirected_to root_url
  end

  test "should not log in with invalid email and password" do
    post login_url, params: {email: nil, password: nil}
    assert_equal I18n.t("sessions.invalid_credentials"), flash.alert
    assert_equal login_path, path
  end

  test "should not log in with invalid email" do
    post login_url, params: {email: nil, password: @password}
    assert_equal I18n.t("sessions.invalid_credentials"), flash.alert
    assert_equal login_path, path
  end

  test "should not log in with invalid password" do
    post login_url, params: {email: @user.email, password: nil}
    assert_equal I18n.t("sessions.invalid_credentials"), flash.alert
    assert_equal login_path, path
  end

  test "should log out" do
    log_in @user
    delete logout_url
    assert_nil session[:user_id]
    assert_equal I18n.t("sessions.logged_out"), flash.notice
    assert_redirected_to login_url
  end

  test "should not log out if already logged out" do
    delete logout_url
    assert_equal I18n.t("sessions.already_logged_out"), flash.alert
    assert_redirected_to login_url
  end
end
