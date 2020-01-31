# frozen_string_literal: true

module SystemTestAssertions
  def assert_page_title(title)
    title = "#{title} - Upupa" unless current_path == root_path
    assert page.has_title?(title)
  end

  def assert_page_description(content)
    element = page.find('meta[name="description"]', visible: false)
    assert_equal content, element[:content]
  end
end
