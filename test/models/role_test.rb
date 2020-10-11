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
    role_two = roles(:two)
    role_two.name = @role.name.swapcase
    assert_not role_two.valid?
    assert role_two.errors.added?(:name, :taken, value: role_two.name)
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
    @role.users = users(:one, :two)
    assert_equal 2, @role.users.count
  end

  test "uniqueness of user" do
    assert_raise(ActiveRecord::RecordNotUnique) do
      @role.users << users(:one, :one)
    end
  end
end
