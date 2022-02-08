require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @password = "mysecret"
  end

  test "validity" do
    assert @user.valid?
  end

  test "validity with password" do
    @user.password = @password
    assert @user.valid?
  end

  test "validity with password and password_confirmation" do
    @user.password = @password
    @user.password_confirmation = @password
    assert @user.valid?
  end

  test "presence of email" do
    @user.email = nil
    assert_not @user.valid?
    assert @user.errors.added?(:email, :blank)
  end

  test "uniqueness of email" do
    another_user = users(:two)
    another_user.email = @user.email
    assert_not another_user.valid?
    assert another_user.errors.added?(:email, :taken, value: another_user.email)
  end

  test "format of email" do
    @user.email = "invalid@"
    assert_not @user.valid?
    assert @user.errors.added?(:email, :invalid, value: @user.email)
  end

  test "presence of password" do
    @user.password = " "
    assert_not @user.valid?
    assert @user.errors.added?(:password, :blank)
  end

  test "length of password" do
    @user.password = "p" * 7
    assert_not @user.valid?
    assert @user.errors.added?(:password, :too_short, count: 8)
    assert_not @user.errors.added?(:password, :blank)

    @user.password = "p" * 19
    assert_not @user.valid?
    assert @user.errors.added?(:password, :too_long, count: 18)
  end

  test "confirmation of password" do
    @user.password = @password
    @user.password_confirmation = "invalid#{@password}"
    assert_not @user.valid?
    assert @user.errors.added?(:password_confirmation, :confirmation, attribute: User.human_attribute_name(:password))
  end

  test "associated user_roles" do
    assert_difference("@user.user_roles.count") do
      @user.user_roles << user_roles(:one)
    end

    @user.destroy
    assert_not @user.user_roles.exists?
  end

  test "associated roles" do
    assert_difference("@user.user_roles.count") do
      @user.roles << roles(:one)
    end
  end

  test "associated word_counts" do
    assert_difference("@user.word_counts.count") do
      @user.word_counts << word_counts(:one)
    end

    assert_not @user.destroy
    assert @user.errors.added?(:base, :"restrict_dependent_destroy.has_many", record: "word counts")
  end

  test "setting email" do
    @user.email = " new@upupa.test "
    assert_equal "new@upupa.test", @user.email

    @user.email = nil
    assert_nil @user.email
  end

  test "checking if the user has a role" do
    role_one = roles(:one)
    assert_not @user.has_role?(role_one.name)
    @user.roles << role_one
    assert @user.has_role?(role_one.name)
  end

  test "checking if the user is an admin" do
    assert_not @user.admin?
    @user.roles << roles(:admin)
    assert @user.admin?
  end

  test "checking if the user is a manager" do
    assert_not @user.manager?
    @user.roles << roles(:manager)
    assert @user.manager?
  end

  test "checking if the user is a project_manager" do
    assert_not @user.project_manager?
    @user.roles << roles(:project_manager)
    assert @user.project_manager?
  end

  test "checking if the user is a translator" do
    assert_not @user.translator?
    @user.roles << roles(:translator)
    assert @user.translator?
  end
end
