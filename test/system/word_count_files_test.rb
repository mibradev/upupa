require "application_system_test_case"

class WordCountFilesTest < ApplicationSystemTestCase
  setup do
    log_in users(:for_word_counts)
    @word_count_file = word_count_files(:one)
  end

  test "creating a Word count file" do
    visit new_word_count_word_count_file_url(@word_count_file.word_count_id)
    fill_in "Actual word count", with: @word_count_file.actual_word_count
    fill_in "Notes", with: @word_count_file.notes
    select @word_count_file.work_file.name, from: "Work file"
    select work_types(:one).name, from: "Work type"
    click_on "Create"
    assert_text "Word count file was successfully created"
  end

  test "updating a Word count file" do
    visit edit_word_count_word_count_file_url(@word_count_file.word_count_id, @word_count_file)
    fill_in "Actual word count", with: @word_count_file.actual_word_count
    fill_in "Notes", with: @word_count_file.notes
    select @word_count_file.work_file.name, from: "Work file"
    select @word_count_file.work_type.name, from: "Work type"
    click_on "Update"
    assert_text "Word count file was successfully updated"
  end

  test "destroying a Word count file" do
    visit word_count_word_count_file_url(@word_count_file.word_count_id, @word_count_file)
    click_on "Destroy"
    assert_text "Word count file was successfully destroyed"
  end
end
