# frozen_string_literal: true

class ActionDispatch::IntegrationTest
  def assert_page_title(title)
    title = "#{title} - Upupa" unless path == root_path
    assert_select "title", title
  end

  def assert_page_description(content)
    assert_select "meta[name='description'][content='#{content}']"
  end
end
