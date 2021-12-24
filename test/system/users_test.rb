require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    log_in users(:admin)
    @user = users(:one)
  end

  test "creating a User" do
    visit new_user_url
    fill_in "Email", with: "new@localhost"
    click_on "Create"
    assert_text "User was successfully created"
  end

  test "updating a User" do
    visit edit_user_url(@user)
    fill_in "Email", with: @user.email
    click_on "Update"
    assert_text "User was successfully updated"
  end

  test "destroying a User" do
    visit user_url(@user)
    click_on "Destroy"
    assert_text "User was successfully destroyed"
  end
end
