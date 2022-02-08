require "test_helper"

class UserRoleTest < ActiveSupport::TestCase
  setup do
    @user_role = user_roles(:one)
  end

  test "validity" do
    assert @user_role.valid?
  end

  test "uniqueness of role" do
    another_user_role = user_roles(:two)
    another_user_role.user_id = @user_role.user_id
    another_user_role.role_id = @user_role.role_id
    assert_not another_user_role.valid?
    assert another_user_role.errors.added?(:role, :taken, value: another_user_role.role)
  end

  test "associated user" do
    @user_role.user = nil
    assert_not @user_role.valid?
    assert @user_role.errors.added?(:user, :blank)
  end

  test "associated role" do
    @user_role.role = nil
    assert_not @user_role.valid?
    assert @user_role.errors.added?(:role, :blank)
  end
end
