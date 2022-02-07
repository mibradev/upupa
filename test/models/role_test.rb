require "test_helper"

class RoleTest < ActiveSupport::TestCase
  setup do
    @role = roles(:one)
  end

  test "presence of name" do
    @role.name = nil
    assert_not @role.valid?
    assert @role.errors.added?(:name, :blank)
  end

  test "uniqueness of name" do
    new_role = Role.new(name: @role.name.swapcase)
    assert_not new_role.valid?
    assert new_role.errors.added?(:name, :taken, value: new_role.name)
  end

  test "squishing name" do
    @role.name = " new  name "
    assert_equal "new name", @role.name

    @role.name = nil
    assert_nil @role.name
  end

  test "has many user_roles" do
    assert_difference("@role.user_roles.count") do
      @role.user_roles << user_roles(:one)
    end

    assert @role.destroy
    assert_not @role.user_roles.exists?
  end

  test "has many users" do
    assert_difference("@role.users.count") do
      @role.users << users(:one)
    end

    assert @role.destroy
    assert_not @role.users.exists?
  end
end
