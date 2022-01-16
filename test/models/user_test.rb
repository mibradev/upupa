require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @password = "12345678"
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
    new_user = User.new(email: @user.email)
    assert_not new_user.valid?
    assert new_user.errors.added?(:email, :taken, value: new_user.email)
  end

  test "format of email" do
    @user.email = "invalid@"
    assert_not @user.valid?
    assert @user.errors.added?(:email, :invalid, value: @user.email)
  end

  test "stripping email" do
    @user.email = " new@localhost "
    assert_equal "new@localhost", @user.email
  end

  test "not stripping absent email" do
    @user.email = nil
    assert_nil @user.email
  end

  test "presence of password" do
    @user.password = " "
    assert_not @user.valid?
    assert @user.errors.added?(:password, :blank)
  end

  test "minimum length of password" do
    @user.password = @password.first(7)
    assert_not @user.valid?
    assert @user.errors.added?(:password, :too_short, count: 8)
  end

  test "maximum length of password" do
    @user.password = @password * 17
    assert_not @user.valid?
    assert @user.errors.added?(:password, :too_long, count: 128)
  end

  test "confirmation of password" do
    @user.password = @password
    @user.password_confirmation = "invalid#{@password}"
    assert_not @user.valid?
    assert @user.errors.added?(:password_confirmation, :confirmation, attribute: User.human_attribute_name(:password))
  end

  test "has many word_counts" do
    assert_difference("@user.word_counts.count") do
      @user.word_counts << word_counts(:one)
    end
  end

  test "dependent word_counts" do
    @user.word_counts << word_counts(:one)
    assert_not @user.destroy
    assert @user.errors.added?(:base, :"restrict_dependent_destroy.has_many", record: "word counts")
  end

  test "has many roles" do
    assert_difference("@user.roles.count") do
      @user.roles << roles(:one)
    end
  end

  test "destroying dependent user_roles" do
    @user.roles << roles(:one)

    assert_difference("UserRole.count", -1) do
      @user.destroy
    end
  end

  test "checking if the user has a role" do
    role_one = roles(:one)
    @user.roles << role_one
    assert @user.has_role?(role_one.name)
  end

  test "checking if the user is admin" do
    @user.roles << roles(:admin)
    assert @user.admin?
  end
end
