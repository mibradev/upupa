# frozen_string_literal: true

require "test_helper"

class FileInfoTest < ActiveSupport::TestCase
  setup do
    @file_info = file_infos(:one)
  end

  test "validity" do
    assert @file_info.valid?
  end

  test "presence of name" do
    @file_info.name = nil
    assert_not @file_info.valid?
    assert @file_info.errors.added?(:name, :blank)
  end

  test "uniqueness of name" do
    file_info = @file_info.dup
    file_info.name = @file_info.name.downcase
    assert_not file_info.valid?
    assert file_info.errors.added?(:name, :taken, value: file_info.name)
  end

  test "stripping name" do
    @file_info.name = " file.doc "
    assert_equal "file.doc", @file_info.name
  end
end
