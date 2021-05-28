require "test_helper"

class WordCountFileTest < ActiveSupport::TestCase
  setup do
    @word_count_file = word_count_files(:one)
  end

  test "validity" do
    assert @word_count_file.valid?
  end

  test "presence of actual_word_count" do
    @word_count_file.actual_word_count = nil
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:actual_word_count, :blank)
    assert_not @word_count_file.errors.added?(:actual_word_count, :not_a_number, value: @word_count_file.actual_word_count)
  end

  test "numericality of actual_word_count" do
    @word_count_file.actual_word_count = "NaN"
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:actual_word_count, :not_a_number, value: "NaN")
  end

  test "type of actual_word_count" do
    @word_count_file.actual_word_count = 1.1
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:actual_word_count, :not_an_integer, value: 1.1)
  end

  test "minimum actual_word_count" do
    @word_count_file.actual_word_count = 0
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:actual_word_count, :greater_than, value: @word_count_file.actual_word_count, count: 0)
  end

  test "uniquness of work_file" do
    word_count_file_two = word_count_files(:two)
    word_count_file_two.work_file = @word_count_file.work_file
    word_count_file_two.work_type = @word_count_file.work_type
    word_count_file_two.word_count = @word_count_file.word_count
    assert_not word_count_file_two.valid?
    assert word_count_file_two.errors.added?(:work_file, :taken, value: word_count_file_two.work_file)
  end

  test "setting work_type_multiplicand" do
    new_word_count_file = @word_count_file.dup
    new_word_count_file.work_type = work_types(:two)
    new_word_count_file.work_type_multiplicand = nil
    assert new_word_count_file.save
    assert_equal new_word_count_file.work_type.multiplicand, new_word_count_file.work_type_multiplicand
  end

  test "locked work_type_multiplicand if record is persisted" do
    @word_count_file.work_type.multiplicand += 1.0
    assert @word_count_file.save
    assert_not_equal @word_count_file.work_type.multiplicand, @word_count_file.work_type_multiplicand
  end

  test "setting total" do
    @word_count_file.total = nil
    assert @word_count_file.save
    assert_equal @word_count_file.actual_word_count * @word_count_file.work_type_multiplicand, @word_count_file.total
  end

  test "presence of word_count" do
    @word_count_file.word_count = nil
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:word_count, :blank)
  end

  test "presence of work_type" do
    @word_count_file.work_type = nil
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:work_type, :blank)
  end

  test "presence of work_file" do
    @word_count_file.work_file = nil
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:work_file, :blank)
  end
end
