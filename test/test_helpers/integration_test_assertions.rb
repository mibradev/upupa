class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def assert_page_description(content)
    assert_select "meta[name='description'][content='#{content}']"
  end
end
