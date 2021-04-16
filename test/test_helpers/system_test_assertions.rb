class ActionDispatch::SystemTestCase
  def assert_page_title(title)
    title = "#{title} - #{I18n.t :app_name}" unless current_path == root_path
    assert page.has_title?(title)
  end

  def assert_page_description(content)
    element = page.find("meta[name='description']", visible: false)
    assert_equal content, element[:content]
  end
end
