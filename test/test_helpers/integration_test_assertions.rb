class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def assert_page_title(title)
    assert_select "title", title
  end

  def assert_page_description(content)
    assert_select "meta[name='description'][content='#{content}']"
  end
end
