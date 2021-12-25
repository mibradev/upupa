require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "logging in" do
    visit login_url
    fill_in User.human_attribute_name(:email), with: users(:with_password).email
    fill_in User.human_attribute_name(:password), with: "12345678"
    click_button I18n.t("actions.sessions.log_in")
    assert_text I18n.t("notices.sessions.logged_in")
  end

  test "logging in with invalid data" do
    visit login_url
    fill_in User.human_attribute_name(:email), with: "invalid@example.com"
    fill_in User.human_attribute_name(:password), with: "invalid_password"
    click_button I18n.t("actions.sessions.log_in")
    assert_text I18n.t("alerts.sessions.invalid_credentials")
  end

  test "logging out" do
    log_in users(:with_password)
    visit root_url
    click_button I18n.t("actions.sessions.log_out")
    assert_text I18n.t("notices.sessions.logged_out")
  end
end
