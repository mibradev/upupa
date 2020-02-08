# frozen_string_literal: true

require "application_system_test_case"

class LoginTest < ApplicationSystemTestCase
  test "logging in" do
    visit new_user_session_url
    assert_page_title "Login"
    assert_page_description "Log into Upupa to access your account."
    assert_selector "h2", text: "Log in"
    assert_selector "input[type='email'][required]"
    assert_selector "input[type='password'][required]"
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "12345678"
    click_button "Log in"
    assert_equal root_path, current_path
    assert_text I18n.t("devise.sessions.signed_in")
  end

  test "logging in with invalid data" do
    visit new_user_session_url
    fill_in "Email", with: "invalid@example.com"
    fill_in "Password", with: "invalid_password"
    click_button "Log in"
    assert_text I18n.t("devise.failure.invalid", authentication_keys: "Email")
  end
end
