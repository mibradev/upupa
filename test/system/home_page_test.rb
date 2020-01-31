# frozen_string_literal: true

require "application_system_test_case"

class HomePageTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_page_title "Upupa"
    assert_page_description "Upupa is a web application that is trying to make life easier for translators."
    assert_selector "h1", text: "U P U P A"
  end
end
