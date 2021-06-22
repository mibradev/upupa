require "test_helper"

class Devise::SessionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:with_password)
    @password = "12345678"
  end

  test "should get login" do
    get new_user_session_url
    assert_response :ok
    assert_page_title "Login - #{I18n.t :app_name}"
    assert_page_description "Log into #{I18n.t :app_name} to access your account."
    assert_select "h2", "Log in"
    assert_select "input[type='email'][autofocus][autocomplete='email'][placeholder='Email']"
    assert_select "input[type='password'][autocomplete='current-password'][placeholder='********']"
    assert_select "input[type='submit'][value='Log in']"
  end

  test "should log in" do
    post user_session_url, params: {user: {email: @user.email, password: @password}}
    assert controller.user_signed_in?
    assert_equal I18n.t("devise.sessions.signed_in"), flash[:notice]
    assert_redirected_to root_url
  end

  test "should not log in with invalid email and password" do
    post user_session_url, params: {user: {email: nil, password: nil}}
    assert_not_signed_in
  end

  test "should not log in with invalid email" do
    post user_session_url, params: {user: {email: nil, password: @password}}
    assert_not_signed_in
  end

  test "should not log in with invalid password" do
    post user_session_url, params: {user: {email: @user.email, password: nil}}
    assert_not_signed_in
  end

  test "should not log in if already authenticated" do
    sign_in @user
    post user_session_url, params: {user: {email: @user.email, password: @password}}
    assert controller.user_signed_in?
    assert_equal I18n.t("devise.failure.already_authenticated"), flash[:alert]
    assert_redirected_to root_url
  end

  test "should log out" do
    sign_in @user
    delete destroy_user_session_url
    assert_not controller.user_signed_in?
    assert_equal I18n.t("devise.sessions.signed_out"), flash[:notice]
    assert_redirected_to root_url
  end

  test "should not log out if already signed out" do
    delete destroy_user_session_url
    assert_not controller.user_signed_in?
    assert_equal I18n.t("devise.sessions.already_signed_out"), flash[:notice]
    assert_redirected_to root_url
  end

  private

  def assert_not_signed_in
    assert_not controller.user_signed_in?
    assert_equal I18n.t("devise.failure.invalid", authentication_keys: "Email"), flash[:alert]
    assert_equal new_user_session_path, path
  end
end
