# frozen_string_literal: true

require "test_helper"

class WorkFileTest < ActiveSupport::TestCase
  setup do
    @work_file = work_files(:one)
  end

  test "validity" do
    assert @work_file.valid?
  end

  test "presence of name" do
    @work_file.name = nil
    assert_not @work_file.valid?
    assert @work_file.errors.added?(:name, :blank)
  end

  test "uniqueness of name" do
    work_file_two = work_files(:two)
    work_file_two.name = @work_file.name.downcase
    assert_not work_file_two.valid?
    assert work_file_two.errors.added?(:name, :taken, value: work_file_two.name)
  end

  test "stripping name" do
    @work_file.name = " file.doc "
    assert_equal "file.doc", @work_file.name
  end

  test "not stripping absent name" do
    @work_file.name = nil
    assert_nil @work_file.name
  end

  test "has many word_count_files" do
    assert_equal 3, @work_file.word_count_files.count
  end

  test "uniqueness of word_count_file" do
    assert_raise(ActiveRecord::RecordNotUnique) do
      @work_file.word_count_files << @work_file.word_count_files.first
    end
  end
end
