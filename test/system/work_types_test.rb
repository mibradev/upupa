require "application_system_test_case"

class WorkTypesTest < ApplicationSystemTestCase
  setup do
    log_in users(:with_password)
    @work_type = work_types(:one)
  end

  test "creating a Work type" do
    visit work_types_url
    click_on "New"
    fill_in "Name", with: "new"
    fill_in "Multiplicand", with: @work_type.multiplicand
    click_on "Create"
    assert_text "Work type was successfully created"
    click_on "Back"
  end

  test "updating a Work type" do
    visit work_types_url
    click_on "Edit", match: :first
    fill_in "Name", with: @work_type.name
    fill_in "Multiplicand", with: @work_type.multiplicand
    click_on "Update"
    assert_text "Work type was successfully updated"
    click_on "Back"
  end

  test "destroying a Work type" do
    visit work_types_url
    click_on "Destroy", match: :first
    assert_text "Work type was successfully destroyed"
  end

  test "destroying a Work type with dependent word count file" do
    @work_type.word_count_files << word_count_files(:one)
    visit work_types_url
    click_on "Destroy", match: :first
    assert_text "Cannot delete record because dependent word count files exist"
  end
end
