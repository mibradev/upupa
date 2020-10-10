# frozen_string_literal: true

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

  test "presence of work_type" do
    @word_count_file.work_type = nil
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:work_type, :blank)
  end

  test "has many work_files" do
    @word_count_file.work_files = work_files(:one, :two)
    assert_equal 2, @word_count_file.work_files.count
  end

  test "uniqueness of work_file" do
    assert_raise(ActiveRecord::RecordNotUnique) do
      @word_count_file.work_files << @word_count_file.work_files.first
    end
  end

  test "presence of work_files" do
    @word_count_file.work_files.clear
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:work_files, :blank)
  end

  test "setting total" do
    @word_count_file.total = nil
    @word_count_file.actual_word_count = 3000
    @word_count_file.work_type.multiplicand = 0.5
    assert @word_count_file.save
    assert_equal 1500, @word_count_file.total
  end

  test "has many word_counts" do
    @word_count_file.word_counts = word_counts(:one, :two)
    assert_equal 2, @word_count_file.word_counts.count
  end

  test "uniqueness of word_counts" do
    assert_raise(ActiveRecord::RecordNotUnique) do
      @word_count_file.word_counts << @word_count_file.word_counts.first
    end
  end

  test "presence of word_counts" do
    @word_count_file.word_counts.clear
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:word_counts, :blank)
  end
end
