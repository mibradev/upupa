# frozen_string_literal: true

require "test_helper"

class RoleTest < ActiveSupport::TestCase
  setup do
    @role = roles(:admin)
  end

  test "validity" do
    assert @role.valid?
    assert_equal "Admin", @role.name
  end

  test "presence of name" do
    @role.name = nil
    assert_not @role.valid?
    assert @role.errors.added?(:name, :blank)
  end

  test "uniqueness of name" do
    role = @role.dup
    role.name = @role.name.downcase
    assert_not role.valid?
    assert role.errors.added?(:name, :taken, value: role.name)
  end

  test "squishing name" do
    @role.name = " Rails  Developer "
    assert_equal "Rails Developer", @role.name
  end

  test "not squishing absent name" do
    @role.name = nil
    assert_nil @role.name
  end
end
