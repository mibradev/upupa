# frozen_string_literal: true

require "test_helper"

class RoleTest < ActiveSupport::TestCase
  setup do
    @role = roles(:one)
  end

  test "validity" do
    assert @role.valid?
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

  test "has many users" do
    @role.users = users.first(2)
    assert_equal 2, @role.users.count
  end

  test "uniqueness of user" do
    role = roles(:admin)
    assert_raise(ActiveRecord::RecordNotUnique) { role.users << role.users.first }
  end
end
