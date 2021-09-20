require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "logging in" do
    visit login_url
    fill_in "Email", with: users(:with_password).email
    fill_in "Password", with: "12345678"
    click_button "Log in"
    assert_text I18n.t("sessions.logged_in")
  end

  test "logging in with invalid data" do
    visit login_url
    fill_in "Email", with: "invalid@example.com"
    fill_in "Password", with: "invalid_password"
    click_button "Log in"
    assert_text I18n.t("sessions.invalid_credentials")
  end

  test "logging out" do
    log_in users(:with_password)
    visit root_url
    click_button "Log out"
    assert_text I18n.t("sessions.logged_out")
  end
end
