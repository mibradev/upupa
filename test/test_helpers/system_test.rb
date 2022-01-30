class ActionDispatch::SystemTestCase
  def log_in(user, password: "mysecret")
    visit login_url
    fill_in User.human_attribute_name(:email), with: user.email
    fill_in User.human_attribute_name(:password), with: password
    click_button I18n.t("page.actions.sessions.log_in")
    has_text? I18n.t("notices.sessions.logged_in")
  end
end
