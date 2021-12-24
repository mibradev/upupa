require "application_system_test_case"

class WordCountsTest < ApplicationSystemTestCase
  setup do
    log_in users(:for_word_counts)
    @word_count = word_counts(:one)
  end

  test "creating a word count" do
    visit new_word_count_url
    find_field "Date", with: Date.current
    fill_in "Notes", with: @word_count.notes
    click_on "Create"
    assert_text I18n.t("notices.created", record: WordCount.model_name.human)
  end

  test "updating a word count" do
    visit edit_word_count_url(@word_count)
    fill_in "Date", with: @word_count.date
    fill_in "Notes", with: @word_count.notes
    click_on "Update"
    assert_text I18n.t("notices.updated", record: WordCount.model_name.human)
  end

  test "destroying a word count" do
    visit word_count_url(@word_count)
    click_on "Destroy"
    assert_text I18n.t("notices.destroyed", record: WordCount.model_name.human)
  end
end
