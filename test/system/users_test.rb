require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    log_in users(:admin)
    @user = users(:one)
  end

  test "creating a user" do
    visit new_user_url
    fill_in "Email", with: "new@localhost"
    click_on I18n.t("helpers.submit.create")
    assert_text I18n.t("notices.created", record: User.model_name.human)
  end

  test "updating a user" do
    visit edit_user_url(@user)
    fill_in "Email", with: @user.email
    click_on I18n.t("helpers.submit.update")
    assert_text I18n.t("notices.updated", record: User.model_name.human)
  end

  test "destroying a user" do
    visit user_url(@user)
    click_on "Destroy"
    assert_text I18n.t("notices.destroyed", record: User.model_name.human)
  end
end
