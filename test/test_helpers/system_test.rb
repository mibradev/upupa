Capybara.default_max_wait_time = 5

class ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers
end
