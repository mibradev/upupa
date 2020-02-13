# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "devise modules" do
    assert_equal [:database_authenticatable], User.devise_modules
  end
end
