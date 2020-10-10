# frozen_string_literal: true

require "test_helper"

class WorkTypeTest < ActiveSupport::TestCase
  setup do
    @work_type = work_types(:one)
  end

  test "validity" do
    assert @work_type.valid?
  end

  test "presence of name" do
    @work_type.name = nil
    assert_not @work_type.valid?
    assert @work_type.errors.added?(:name, :blank)
  end

  test "uniqueness of name" do
    work_type_two = work_types(:two)
    work_type_two.name = @work_type.name.downcase
    assert_not work_type_two.valid?
    assert work_type_two.errors.added?(:name, :taken, value: work_type_two.name)
  end

  test "squishing name" do
    @work_type.name = " MS  Revision "
    assert_equal "MS Revision", @work_type.name
  end

  test "not squishing absent name" do
    @work_type.name = nil
    assert_nil @work_type.name
  end

  test "presence of multiplicand" do
    @work_type.multiplicand = nil
    assert_not @work_type.valid?
    assert @work_type.errors.added?(:multiplicand, :blank)
    assert_not @work_type.errors.added?(:multiplicand, :not_a_number, value: @work_type.multiplicand)
  end

  test "numericality of multiplicand" do
    @work_type.multiplicand = "NaN"
    assert_not @work_type.valid?
    assert @work_type.errors.added?(:multiplicand, :not_a_number, value: "NaN")
  end

  test "has many word_count_files" do
    @work_type.word_count_files = word_count_files(:one, :two)
    assert_equal 2, @work_type.word_count_files.count
  end
end
