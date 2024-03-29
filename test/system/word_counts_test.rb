require "application_system_test_case"

class WordCountsTest < ApplicationSystemTestCase
  setup do
    log_in users(:translator)
    @word_count = word_counts(:by_translator)
  end

  test "creating a word_count" do
    visit new_word_count_url
    find_field WordCount.human_attribute_name(:date), with: Date.current
    fill_in WordCount.human_attribute_name(:notes), with: @word_count.notes
    click_button I18n.t("helpers.submit.create")
    assert_text I18n.t("notices.created", record: WordCount.model_name.human)
  end

  test "updating a word_count" do
    visit edit_word_count_url(@word_count)
    fill_in WordCount.human_attribute_name(:date), with: @word_count.date
    fill_in WordCount.human_attribute_name(:notes), with: @word_count.notes
    click_button I18n.t("helpers.submit.update")
    assert_text I18n.t("notices.updated", record: WordCount.model_name.human)
  end

  test "destroying a word_count" do
    visit word_count_url(@word_count)
    accept_confirm { click_button I18n.t("views.actions.destroy") }
    assert_text I18n.t("notices.destroyed", record: WordCount.model_name.human)
  end
end
