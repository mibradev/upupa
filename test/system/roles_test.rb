require "application_system_test_case"

class RolesTest < ApplicationSystemTestCase
  setup do
    log_in users(:admin)
    @role = roles(:one)
  end

  test "creating a role" do
    visit new_role_url
    fill_in "Name", with: "new"
    click_on "Create"
    assert_text I18n.t("notices.created", record: Role.model_name.human)
  end

  test "updating a role" do
    visit edit_role_url(@role)
    fill_in "Name", with: @role.name
    click_on "Update"
    assert_text I18n.t("notices.updated", record: Role.model_name.human)
  end

  test "destroying a role" do
    visit role_url(@role)
    click_on "Destroy"
    assert_text I18n.t("notices.destroyed", record: Role.model_name.human)
  end
end
