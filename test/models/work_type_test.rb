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
    assert_equal 1, @work_type.errors[:name].count
  end

  test "uniqueness of name" do
    another_work_type = work_types(:two)
    another_work_type.name = @work_type.name.swapcase
    assert_not another_work_type.valid?
    assert another_work_type.errors.added?(:name, :taken, value: another_work_type.name)
  end

  test "presence of multiplicand" do
    @work_type.multiplicand = nil
    assert_not @work_type.valid?
    assert @work_type.errors.added?(:multiplicand, :blank)
    assert_equal 1, @work_type.errors[:multiplicand].count
  end

  test "numericality of multiplicand" do
    @work_type.multiplicand = "NaN"
    assert_not @work_type.valid?
    assert @work_type.errors.added?(:multiplicand, :not_a_number, value: "NaN")
  end

  test "minimum multiplicand" do
    @work_type.multiplicand = 0.0
    assert_not @work_type.valid?
    assert @work_type.errors.added?(:multiplicand, :greater_than, value: @work_type.multiplicand, count: 0.0)
  end

  test "associated word_count_files" do
    assert_difference("@work_type.word_count_files.count") do
      @work_type.word_count_files << word_count_files(:one)
    end

    assert_not @work_type.destroy
    assert @work_type.errors.added?(:base, :"restrict_dependent_destroy.has_many", record: "word count files")
  end

  test "setting name" do
    @work_type.name = " new  name "
    assert_equal "new name", @work_type.name

    @work_type.name = nil
    assert_nil @work_type.name
  end
end
