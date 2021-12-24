require "application_system_test_case"

class WorkFilesTest < ApplicationSystemTestCase
  setup do
    log_in users(:with_password)
    @work_file = work_files(:one)
  end

  test "creating a work file" do
    visit new_work_file_url
    fill_in "Name", with: "new"
    click_on "Create"
    assert_text "Work file was successfully created"
  end

  test "updating a work file" do
    visit edit_work_file_url(@work_file)
    fill_in "Name", with: @work_file.name
    click_on "Update"
    assert_text "Work file was successfully updated"
  end

  test "destroying a work file" do
    visit work_file_url(@work_file)
    click_on "Destroy"
    assert_text "Work file was successfully destroyed"
  end
end
