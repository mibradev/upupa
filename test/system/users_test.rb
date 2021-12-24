require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    log_in users(:admin)
    @user = users(:one)
  end

  test "creating a User" do
    visit users_url
    click_on "New"
    fill_in "Email", with: "new@localhost"
    click_on "Create"
    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first
    fill_in "Email", with: @user.email
    click_on "Update"
    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    click_on "Destroy", match: :first
    assert_text "User was successfully destroyed"
  end
end
