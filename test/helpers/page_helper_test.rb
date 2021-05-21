require "test_helper"

class PageHelperTest < ActionView::TestCase
  test "page title" do
    view.page.title = "Page Title"
    assert_equal "Page Title", view.page.title
  end

  test "page description" do
    view.page.description = "Page description."
    assert_equal "Page description.", view.page.description
  end
end
