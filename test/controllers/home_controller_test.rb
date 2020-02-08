# frozen_string_literal: true

require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :ok
    assert_page_title "Upupa"
    assert_page_description "Upupa is a web application that is trying to make life easier for translators."
    assert_select "h1", text: /U\s*P\s*U\s*P\s*A/
  end
end
