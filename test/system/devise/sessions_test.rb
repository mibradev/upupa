require "application_system_test_case"

class Devise::SessionsTest < ApplicationSystemTestCase
  test "logging in" do
    visit new_user_session_url
    fill_in "Email", with: users(:with_password).email
    fill_in "Password", with: "12345678"
    click_button "Log in"
    assert_text I18n.t("devise.sessions.signed_in")
  end

  test "logging in with invalid data" do
    visit new_user_session_url
    fill_in "Email", with: "invalid@example.com"
    fill_in "Password", with: "invalid_password"
    click_button "Log in"
    assert_text I18n.t("devise.failure.invalid", authentication_keys: User.human_attribute_name(:email))
  end

  test "logging out" do
    sign_in users(:one)
    visit root_url
    click_button "Log out"
    assert_text I18n.t("devise.failure.unauthenticated")
  end
end
