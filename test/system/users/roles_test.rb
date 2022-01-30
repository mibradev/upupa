require "application_system_test_case"

class Users::RolesTest < ApplicationSystemTestCase
  setup do
    log_in users(:admin)
    @user = users(:for_user_roles)
  end

  test "creating a user_role" do
    visit user_url(@user)

    within("#user_roles") do
      select roles(:one).name, from: UserRole.human_attribute_name(:role)
      click_on I18n.t("helpers.submit.submit")
    end

    assert_text I18n.t("notices.created", record: UserRole.model_name.human)
  end

  test "destroying a user_role" do
    visit user_url(@user)
    within("#user_roles") { accept_confirm { click_on I18n.t("page.actions.destroy") } }
    assert_text I18n.t("notices.destroyed", record: UserRole.model_name.human)
  end
end
