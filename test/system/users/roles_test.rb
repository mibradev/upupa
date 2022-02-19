require "application_system_test_case"

class Users::RolesTest < ApplicationSystemTestCase
  setup do
    log_in users(:admin)
    @user = users(:for_role_assignment_one)
  end

  test "creating a role_assignment" do
    visit user_url(@user)

    within("#roles") do
      select roles(:one).name, from: RoleAssignment.human_attribute_name(:role)
      click_button I18n.t("helpers.submit.submit")
    end

    assert_text I18n.t("notices.created", record: RoleAssignment.model_name.human)
  end

  test "destroying a role_assignment" do
    visit user_url(@user)
    within("#roles") { accept_confirm { click_button I18n.t("page.actions.destroy") } }
    assert_text I18n.t("notices.destroyed", record: RoleAssignment.model_name.human)
  end
end
