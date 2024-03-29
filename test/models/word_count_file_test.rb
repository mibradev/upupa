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
    assert_equal 1, @word_count_file.errors[:actual_word_count].count
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

  test "uniqueness of work_file" do
    another_word_count_file = word_count_files(:two)
    another_word_count_file.work_file_id = @word_count_file.work_file_id
    another_word_count_file.work_type_id = @word_count_file.work_type_id
    another_word_count_file.word_count_id = @word_count_file.word_count_id
    assert_not another_word_count_file.valid?
    assert another_word_count_file.errors.added?(:work_file, :taken, value: another_word_count_file.work_file)
  end

  test "validity with existing work_file and word_count" do
    another_word_count_file = word_count_files(:two)
    another_word_count_file.work_file_id = @word_count_file.work_file_id
    another_word_count_file.word_count_id = @word_count_file.word_count_id
    assert another_word_count_file.valid?
  end

  test "validity with existing work_file and work_type" do
    another_word_count_file = word_count_files(:two)
    another_word_count_file.work_file_id = @word_count_file.work_file_id
    another_word_count_file.work_type_id = @word_count_file.work_type_id
    assert another_word_count_file.valid?
  end

  test "associated word_count" do
    @word_count_file.word_count = nil
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:word_count, :blank)
  end

  test "associated work_file" do
    @word_count_file.work_file = nil
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:work_file, :blank)
  end

  test "associated work_type" do
    @word_count_file.work_type = nil
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:work_type, :blank)
  end

  test "setting notes" do
    @word_count_file.notes = " new notes "
    assert_equal "new notes", @word_count_file.notes

    @word_count_file.notes = nil
    assert_nil @word_count_file.notes
  end

  test "total" do
    @word_count_file.actual_word_count = 2
    @word_count_file.work_type.multiplicand = 3
    assert_equal 6, @word_count_file.total
  end
end
