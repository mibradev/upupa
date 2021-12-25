require "application_system_test_case"

class WordCountFilesTest < ApplicationSystemTestCase
  setup do
    log_in users(:for_word_counts)
    @word_count_file = word_count_files(:one)
  end

  test "creating a word count file" do
    visit new_word_count_word_count_file_url(@word_count_file.word_count_id)
    fill_in "Actual word count", with: @word_count_file.actual_word_count
    fill_in "Notes", with: @word_count_file.notes
    select @word_count_file.work_file.name, from: "Work file"
    select work_types(:one).name, from: "Work type"
    click_on I18n.t("helpers.submit.create")
    assert_text I18n.t("notices.created", record: WordCountFile.model_name.human)
  end

  test "updating a word count file" do
    visit edit_word_count_word_count_file_url(@word_count_file.word_count_id, @word_count_file)
    fill_in "Actual word count", with: @word_count_file.actual_word_count
    fill_in "Notes", with: @word_count_file.notes
    select @word_count_file.work_file.name, from: "Work file"
    select @word_count_file.work_type.name, from: "Work type"
    click_on I18n.t("helpers.submit.update")
    assert_text I18n.t("notices.updated", record: WordCountFile.model_name.human)
  end

  test "destroying a word count file" do
    visit word_count_word_count_file_url(@word_count_file.word_count_id, @word_count_file)
    click_on I18n.t("actions.destroy")
    assert_text I18n.t("notices.destroyed", record: WordCountFile.model_name.human)
  end
end
