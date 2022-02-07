require "test_helper"

class UserRoleTest < ActiveSupport::TestCase
  setup do
    @user_role = user_roles(:one)
  end

  test "presence of user" do
    @user_role.user_id = nil
    assert_not @user_role.valid?
    assert @user_role.errors.added?(:user, :blank)
  end

  test "presence of role" do
    @user_role.role_id = nil
    assert_not @user_role.valid?
    assert @user_role.errors.added?(:role, :blank)
  end

  test "uniqueness of role" do
    new_user_role = UserRole.new(user_id: @user_role.user_id, role_id: @user_role.role_id)
    assert_not new_user_role.valid?
    assert new_user_role.errors.added?(:role, :taken, value: new_user_role.role)
  end
end
