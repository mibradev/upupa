class ActionDispatch::IntegrationTest
  def assert_page_title(title)
    title = "#{title} - #{I18n.t :app_name}" unless path == root_path
    assert_select "title", title
  end

  def assert_page_description(content)
    assert_select "meta[name='description'][content='#{content}']"
  end
end
