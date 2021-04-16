require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "page title" do
    view.page_title "Page Title"
    assert_equal "Page Title - #{I18n.t :app_name}", view.content_for(:page_title)
  end

  test "page title in home page" do
    view.request.path = root_path
    view.page_title "Page Title"
    assert_equal "Page Title", view.content_for(:page_title)
  end

  test "page description" do
    view.page_description "Page description."
    assert_equal "Page description.", view.content_for(:page_description)
  end
end
