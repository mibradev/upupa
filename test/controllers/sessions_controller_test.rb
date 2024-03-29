require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:with_password)
    @password = "mysecret"
  end

  test "should get login" do
    get login_url
    assert_response :ok
  end

  test "should not get login if already logged in" do
    post login_url, params: {email: @user.email, password: @password}
    get login_url
    assert_equal I18n.t("alerts.sessions.already_logged_in"), flash.alert
    assert_redirected_to root_url
  end

  test "should log in" do
    post login_url, params: {email: @user.email, password: @password}
    assert_equal @user.id, session[:user_id]
    assert_equal I18n.t("notices.sessions.logged_in"), flash.notice
    assert_redirected_to root_url
  end

  test "should not log in if already logged in" do
    2.times { post login_url, params: {email: @user.email, password: @password} }
    assert_equal I18n.t("alerts.sessions.already_logged_in"), flash.alert
    assert_redirected_to root_url
  end

  test "should not log in with invalid email and password" do
    post login_url, params: {email: nil, password: nil}
    assert_equal I18n.t("alerts.sessions.invalid_credentials"), flash.alert
    assert_response :unprocessable_entity
  end

  test "should not log in with invalid email" do
    post login_url, params: {email: nil, password: @password}
    assert_equal I18n.t("alerts.sessions.invalid_credentials"), flash.alert
    assert_response :unprocessable_entity
  end

  test "should not log in with invalid password" do
    post login_url, params: {email: @user.email, password: nil}
    assert_equal I18n.t("alerts.sessions.invalid_credentials"), flash.alert
    assert_response :unprocessable_entity
  end

  test "should not log in if the user has no password" do
    post login_url, params: {email: users(:one).email, password: nil}
    assert_equal I18n.t("alerts.sessions.invalid_credentials"), flash.alert
    assert_response :unprocessable_entity
  end

  test "should redirect to the desired page after login" do
    get word_counts_url
    post login_url, params: {email: @user.email, password: @password}
    assert_redirected_to word_counts_url
  end

  test "should log out" do
    post login_url, params: {email: @user.email, password: @password}
    delete logout_url
    assert_nil session[:user_id]
    assert_equal I18n.t("notices.sessions.logged_out"), flash.notice
    assert_redirected_to login_url
  end

  test "should not log out if already logged out" do
    delete logout_url
    assert_equal I18n.t("alerts.sessions.already_logged_out"), flash.alert
    assert_redirected_to login_url
  end

  test "should not cause too many redirects after destroying a logged in user" do
    post login_url, params: {email: @user.email, password: @password}
    @user.destroy!
    get login_url
    assert_response :ok
  end
end
