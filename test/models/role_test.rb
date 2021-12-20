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
    new_role = Role.new(name: @role.name.swapcase)
    assert_not new_role.valid?
    assert new_role.errors.added?(:name, :taken, value: new_role.name)
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
    assert_difference("@role.users.count") do
      @role.users << users(:one)
    end
  end

  test "destroying dependent user_roles" do
    @role.users << users(:one)

    assert_difference("UserRole.count", -1) do
      @role.destroy
    end
  end

  test "cannot update a system role" do
    @role.system_role = true
    assert_not @role.save
    assert @role.errors.added?(:base, :system_role)
  end

  test "cannot destroy a system role" do
    @role.system_role = true
    assert_not @role.destroy
    assert @role.errors.added?(:base, :system_role)
  end
end
