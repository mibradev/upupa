require "test_helper"

class PageHelperTest < ActionView::TestCase
  test "page title" do
    view.page.title = "Page Title"
    assert_equal "Page Title", view.page.title
  end
end
