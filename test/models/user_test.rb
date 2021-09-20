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
    user_two = users(:two)
    user_two.email = @user.email
    assert_not user_two.valid?
    assert user_two.errors.added?(:email, :taken, value: user_two.email)
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

  test "uniqueness of role" do
    assert_raise(ActiveRecord::RecordNotUnique) do
      @user.roles << roles(:one, :one)
    end
  end
end
