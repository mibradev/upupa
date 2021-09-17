require "application_system_test_case"

class WorkFilesTest < ApplicationSystemTestCase
  setup do
    @work_file = work_files(:one)
  end

  test "visiting the index" do
    visit work_files_url
    assert_selector "h1", text: "Work Files"
  end

  test "creating a Work file" do
    visit work_files_url
    click_on "New"
    fill_in "Name", with: "new"
    click_on "Create"
    assert_text "Work file was successfully created"
    click_on "Back"
  end

  test "updating a Work file" do
    visit work_files_url
    click_on "Edit", match: :first
    fill_in "Name", with: @work_file.name
    click_on "Update"
    assert_text "Work file was successfully updated"
    click_on "Back"
  end

  test "destroying a Work file" do
    visit work_files_url
    click_on "Destroy", match: :first
    assert_text "Work file was successfully destroyed"
  end

  test "destroying a Work file with dependent word count file" do
    @work_file.word_count_files << word_count_files(:one)
    visit work_files_url
    click_on "Destroy", match: :first
    assert_text "Cannot delete record because dependent word count files exist"
  end
end
