require "application_system_test_case"

class WordCountsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @word_count = word_counts(:one)
  end

  test "visiting the index" do
    visit word_counts_url
    assert_selector "h2", text: "Word Counts"
  end

  test "creating a Word count" do
    sign_in users(:one)

    visit word_counts_url
    click_on "New"
    fill_in "Date", with: Date.current
    fill_in "Notes", with: @word_count.notes
    click_on "Create"
    assert_text "Word count was successfully created"
    click_on "Back"
  end

  test "updating a Word count" do
    visit word_counts_url
    click_on "Edit", match: :first
    fill_in "Date", with: Date.current
    fill_in "Notes", with: @word_count.notes
    click_on "Update"
    assert_text "Word count was successfully updated"
    click_on "Back"
  end

  test "destroying a Word count" do
    visit word_counts_url

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Word count was successfully destroyed"
  end
end
