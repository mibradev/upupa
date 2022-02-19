require "test_helper"

class RoleAssignmentTest < ActiveSupport::TestCase
  setup do
    @role_assignment = role_assignments(:one)
  end

  test "validity" do
    assert @role_assignment.valid?
  end

  test "uniqueness of role" do
    another_role_assignment = role_assignments(:two)
    another_role_assignment.role_id = @role_assignment.role_id
    another_role_assignment.user_id = @role_assignment.user_id
    assert_not another_role_assignment.valid?
    assert another_role_assignment.errors.added?(:role, :taken, value: another_role_assignment.role)
  end

  test "validity with existing role" do
    another_role_assignment = role_assignments(:two)
    another_role_assignment.role_id = @role_assignment.role_id
    assert another_role_assignment.valid?
  end

  test "associated role" do
    @role_assignment.role = nil
    assert_not @role_assignment.valid?
    assert @role_assignment.errors.added?(:role, :blank)
  end

  test "associated user" do
    @role_assignment.user = nil
    assert_not @role_assignment.valid?
    assert @role_assignment.errors.added?(:user, :blank)
  end
end
