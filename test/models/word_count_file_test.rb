# frozen_string_literal: true

require "test_helper"

class WordCountFileTest < ActiveSupport::TestCase
  setup do
    @word_count_file = word_count_files(:one)
  end

  test "validity" do
    assert @word_count_file.valid?
  end

  test "presence of name" do
    @word_count_file.name = nil
    assert_not @word_count_file.valid?
    assert @word_count_file.errors.added?(:name, :blank)
  end

  test "uniqueness of name" do
    word_count_file = @word_count_file.dup
    word_count_file.name = @word_count_file.name.downcase
    assert_not word_count_file.valid?
    assert word_count_file.errors.added?(:name, :taken, value: word_count_file.name)
  end

  test "stripping name" do
    @word_count_file.name = " file.doc "
    assert_equal "file.doc", @word_count_file.name
  end

  test "not stripping absent name" do
    @word_count_file.name = nil
    assert_nil @word_count_file.name
  end

  test "has many word counts" do
    assert @word_count_file.word_counts.count > 1
  end
end
