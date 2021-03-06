# frozen_string_literal: true

require "test_helper"
require "test_helpers/system_test_assertions"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
end
