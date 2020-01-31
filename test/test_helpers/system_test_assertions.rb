# frozen_string_literal: true

module SystemTestAssertions
  def assert_page_title(title)
    title = "#{title} - Upupa" unless current_path == root_path
    assert page.has_title?(title)
  end
end
