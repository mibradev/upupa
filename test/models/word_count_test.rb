# frozen_string_literal: true

require "test_helper"

class WordCountTest < ActiveSupport::TestCase
  setup do
    @word_count = word_counts(:one)
  end

  test "validity" do
    assert @word_count.valid?
  end

  test "presence of date" do
    @word_count.date = nil
    assert_not @word_count.valid?
    assert @word_count.errors.added?(:date, :blank)
  end

  test "uniquness of date" do
    word_count_two = word_counts(:two)
    word_count_two.date = @word_count.date
    word_count_two.user_id = @word_count.user_id
    assert_not word_count_two.valid?
    assert word_count_two.errors.added?(:date, :taken, value: word_count_two.date)
  end

  test "range of date" do
    @word_count.date = Date.tomorrow
    assert_not @word_count.valid?
    assert @word_count.errors.added?(:date, :future_date)
  end

  test "presence of actual_word_count" do
    @word_count.actual_word_count = nil
    assert_not @word_count.valid?
    assert @word_count.errors.added?(:actual_word_count, :blank)
    assert_not @word_count.errors.added?(:actual_word_count, :not_a_number, value: @word_count.actual_word_count)
  end

  test "type of actual_word_count" do
    @word_count.actual_word_count = 1.1
    assert_not @word_count.valid?
    assert @word_count.errors.added?(:actual_word_count, :not_an_integer, value: 1.1)
  end

  test "minimum actual_word_count" do
    @word_count.actual_word_count = 0
    assert_not @word_count.valid?
    assert @word_count.errors.added?(:actual_word_count, :greater_than, value: @word_count.actual_word_count, count: 0)
  end

  test "presence of user" do
    @word_count.user = nil
    assert_not @word_count.valid?
    assert @word_count.errors.added?(:user, :blank)
  end

  test "presence of work_type" do
    @word_count.work_type = nil
    assert_not @word_count.valid?
    assert @word_count.errors.added?(:work_type, :blank)
  end

  test "has many word_count_files" do
    assert_equal 2, word_counts(:with_word_count_files).word_count_files.count
  end

  test "uniqueness of word_count_file" do
    assert_raise(ActiveRecord::RecordNotUnique) do
      @word_count.word_count_files << @word_count.word_count_files.first
    end
  end

  test "presence of word_count_files" do
    @word_count.word_count_files.clear
    assert_not @word_count.valid?
    assert @word_count.errors.added?(:word_count_files, :blank)
  end

  test "setting total" do
    @word_count.total = nil
    @word_count.actual_word_count = 3000
    @word_count.work_type.multiplicand = 0.5
    assert @word_count.save
    assert_equal 1500, @word_count.total
  end
end
