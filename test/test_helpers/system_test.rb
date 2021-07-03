Capybara.default_max_wait_time = 10

class ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers
end
