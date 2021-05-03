require "application_system_test_case"

class WordCountFilesTest < ApplicationSystemTestCase
  setup do
    @word_count_file = word_count_files(:one)
  end

  test "visiting the index" do
    visit word_count_files_url
    assert_selector "h2", text: "Word Count Files"
  end

  test "creating a Word count file" do
    visit word_count_files_url
    click_on "New"
    fill_in "Actual word count", with: @word_count_file.actual_word_count
    fill_in "Notes", with: @word_count_file.notes
    select @word_count_file.word_count.date.to_s, from: "Word count"
    select @word_count_file.work_file.name, from: "Work file"
    select @word_count_file.work_type.name, from: "Work type"
    click_on "Create"
    assert_text "Word count file was successfully created"
    click_on "Back"
  end

  test "updating a Word count file" do
    visit word_count_files_url
    click_on "Edit", match: :first
    fill_in "Actual word count", with: @word_count_file.actual_word_count
    fill_in "Notes", with: @word_count_file.notes
    click_on "Update"
    assert_text "Word count file was successfully updated"
    click_on "Back"
  end

  test "destroying a Word count file" do
    visit word_count_files_url

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Word count file was successfully destroyed"
  end
end
