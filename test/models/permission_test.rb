require "test_helper"

class PermissionTest < ActiveSupport::TestCase
  setup do
    @permission = permissions(:one)
  end

  test "validity" do
    assert @permission.valid?
  end

  test "presence of name" do
    @permission.name = nil
    assert_not @permission.valid?
    assert @permission.errors.added?(:name, :blank)
  end

  test "uniqueness of name" do
    new_permission = Permission.new(name: @permission.name.swapcase)
    assert_not new_permission.valid?
    assert new_permission.errors.added?(:name, :taken, value: new_permission.name)
  end

  test "squishing name" do
    @permission.name = " New  Permission "
    assert_equal "New Permission", @permission.name
  end

  test "not squishing absent name" do
    @permission.name = nil
    assert_nil @permission.name
  end
end
