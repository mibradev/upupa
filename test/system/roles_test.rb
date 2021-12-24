require "application_system_test_case"

class RolesTest < ApplicationSystemTestCase
  setup do
    log_in users(:admin)
    @role = roles(:one)
  end

  test "creating a Role" do
    visit new_role_url
    fill_in "Name", with: "new"
    click_on "Create"
    assert_text "Role was successfully created"
  end

  test "updating a Role" do
    visit edit_role_url(@role)
    fill_in "Name", with: @role.name
    click_on "Update"
    assert_text "Role was successfully updated"
  end

  test "destroying a Role" do
    visit role_url(@role)
    click_on "Destroy"
    assert_text "Role was successfully destroyed"
  end
end
