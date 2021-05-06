require "application_system_test_case"

class WorkTypesTest < ApplicationSystemTestCase
  setup do
    sign_in users(:one)
    @work_type = work_types(:one)
  end

  test "visiting the index" do
    visit work_types_url
    assert_selector "h2", text: "Work Types"
  end

  test "creating a Work type" do
    visit work_types_url
    click_on "New"
    fill_in "Multiplicand", with: @work_type.multiplicand
    fill_in "Name", with: "New Work Type"
    click_on "Create"
    assert_text "Work type was successfully created"
    click_on "Back"
  end

  test "updating a Work type" do
    visit work_types_url
    click_on "Edit", match: :first
    fill_in "Multiplicand", with: @work_type.multiplicand
    fill_in "Name", with: @work_type.name
    click_on "Update"
    assert_text "Work type was successfully updated"
    click_on "Back"
  end

  test "destroying a Work type" do
    visit work_types_url

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work type was successfully destroyed"
  end

  test "destroying a Work type with dependent word count file" do
    @work_type.word_count_files << word_count_files(:one)
    visit work_types_url

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cannot delete record because dependent word count files exist"
  end
end
