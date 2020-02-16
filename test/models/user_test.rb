# frozen_string_literal: true

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

  test "validity with password and password confirmation" do
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
    user = @user.dup
    assert_not user.valid?
    assert user.errors.added?(:email, :taken, value: user.email)
  end

  test "format of email" do
    @user.email = "invalid@"
    assert_not @user.valid?
    assert @user.errors.added?(:email, :invalid, value: @user.email)
  end

  test "presence of password" do
    user = User.new
    assert_not user.valid?
    assert user.errors.added?(:password, :blank)
  end

  test "minimum length of password" do
    @user.password = @password.chop
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
    @user.password_confirmation = @password * 2
    assert_not @user.valid?
    assert @user.errors.added?(:password_confirmation, :confirmation, attribute: User.human_attribute_name(:password))
  end
end
