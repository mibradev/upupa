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
    assert_equal 1, @role.errors[:name].count
  end

  test "uniqueness of name" do
    another_role = roles(:two)
    another_role.name = @role.name.swapcase
    assert_not another_role.valid?
    assert another_role.errors.added?(:name, :taken, value: another_role.name)
  end

  test "associated user_roles" do
    assert_difference("@role.user_roles.count") do
      @role.user_roles << user_roles(:one)
    end

    @role.destroy
    assert_not @role.user_roles.exists?
  end

  test "associated users" do
    assert_difference("@role.user_roles.count") do
      @role.users << users(:one)
    end
  end

  test "setting name" do
    @role.name = " new  name "
    assert_equal "new name", @role.name

    @role.name = nil
    assert_nil @role.name
  end
end
