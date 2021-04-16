require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :ok
    assert_page_title I18n.t(:app_name)
    assert_page_description "#{I18n.t :app_name} is a web application that is trying to make life easier for translators."
    assert_select "h1", I18n.t(:app_name).upcase
  end
end
