require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :ok
    assert_select "title", I18n.t(:app_name)
    assert_select "h2", "Welcome to #{I18n.t :app_name}!"
  end
end
