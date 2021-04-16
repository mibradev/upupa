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

  test "presence of user" do
    @word_count.user = nil
    assert_not @word_count.valid?
    assert @word_count.errors.added?(:user, :blank)
  end

  test "has many word_count_files" do
    @word_count.word_count_files = word_count_files(:one, :two)
    assert_equal 2, @word_count.word_count_files.count
  end

  test "uniqueness of word_count_file" do
    assert_raise(ActiveRecord::RecordNotUnique) do
      @word_count.word_count_files << word_count_files(:one, :one)
    end
  end
end
