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
    assert_equal 1, @work_file.errors[:name].count
  end

  test "uniqueness of name" do
    another_work_file = work_files(:two)
    another_work_file.name = @work_file.name.swapcase
    assert_not another_work_file.valid?
    assert another_work_file.errors.added?(:name, :taken, value: another_work_file.name)
  end

  test "associated word_count_files" do
    assert_difference("@work_file.word_count_files.count") do
      @work_file.word_count_files << word_count_files(:one)
    end

    assert_not @work_file.destroy
    assert @work_file.errors.added?(:base, :"restrict_dependent_destroy.has_many", record: "word count files")
  end

  test "setting name" do
    @work_file.name = " new  name "
    assert_equal "new name", @work_file.name

    @work_file.name = nil
    assert_nil @work_file.name
  end
end
