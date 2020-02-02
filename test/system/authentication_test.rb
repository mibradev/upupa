# frozen_string_literal: true

require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @password = "12345678"
  end

  test "successful login" do
    visit new_user_session_url
    assert_page_title "Login"
    assert_page_description "Log into Upupa to access your account."
    assert_selector "h2", text: "Log in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @password
    click_button "Log in"
    assert_equal root_path, current_path
    assert_text I18n.t("devise.sessions.signed_in")
  end

  test "failed login" do
    visit new_user_session_url
    click_button "Log in"
    assert_equal new_user_session_path, current_path
    assert_text I18n.t("devise.failure.invalid", authentication_keys: "Email")
  end

  test "invalid email" do
    visit new_user_session_url
    fill_in "Password", with: @password
    click_button "Log in"
    assert_text I18n.t("devise.failure.invalid", authentication_keys: "Email")
  end

  test "invalid password" do
    visit new_user_session_url
    fill_in "Email", with: @user.email
    click_button "Log in"
    assert_text I18n.t("devise.failure.invalid", authentication_keys: "Email")
  end
end
