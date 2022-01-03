require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    log_in users(:admin)
    @user = users(:one)
  end

  test "creating a user" do
    visit new_user_url
    fill_in User.human_attribute_name(:email), with: "new@localhost"
    click_on I18n.t("helpers.submit.create")
    assert_text I18n.t("notices.created", record: User.model_name.human)
  end

  test "updating a user" do
    visit edit_user_url(@user)
    fill_in User.human_attribute_name(:email), with: @user.email
    click_on I18n.t("helpers.submit.update")
    assert_text I18n.t("notices.updated", record: User.model_name.human)
  end

  test "destroying a user" do
    visit user_url(@user)
    accept_confirm { click_on I18n.t("page.actions.destroy") }
    assert_text I18n.t("notices.destroyed", record: User.model_name.human)
  end
end
