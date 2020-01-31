# frozen_string_literal: true

class ApplicationHelperTest < ActionView::TestCase
  test "page title" do
    view.page_title("Page Title")
    assert_equal "Page Title - Upupa", view.content_for(:page_title)
  end

  test "page title in home page" do
    view.request.path = root_path
    view.page_title("Page Title")
    assert_equal "Page Title", view.content_for(:page_title)
  end
end