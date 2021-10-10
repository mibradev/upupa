class ActionDispatch::SystemTestCase
  def log_in(user, password: "12345678")
    visit login_url
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_button "Log in"
    has_text? I18n.t("sessions.logged_in")
  end
end
