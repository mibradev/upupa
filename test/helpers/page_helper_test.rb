require "test_helper"

class PageHelperTest < ActionView::TestCase
  test "page title" do
    view.page.title "Page Title"
    assert_equal "Page Title", view.content_for(:page_title)
  end

  test "page description" do
    view.page.description "Page description."
    assert_equal "Page description.", view.content_for(:page_description)
  end
end
