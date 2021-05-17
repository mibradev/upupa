class ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers

  def assert_page_title(title)
    assert page.has_title?(title)
  end

  def assert_page_description(content)
    element = page.find("meta[name='description']", visible: false)
    assert_equal content, element[:content]
  end
end
