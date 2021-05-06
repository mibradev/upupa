require "test_helper"

class WordCountFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @word_count_file = word_count_files(:one)
  end

  test "should get new" do
    get new_word_count_word_count_file_url(@word_count_file.word_count_id)
    assert_response :ok
  end

  test "should create word_count_file" do
    assert_difference("WordCountFile.count") do
      post word_count_word_count_files_url(@word_count_file.word_count_id), params: { word_count_file: {
        actual_word_count: @word_count_file.actual_word_count,
        notes: @word_count_file.notes,
        work_file_id: @word_count_file.work_file_id,
        work_type_id: @word_count_file.work_type_id
      } }
    end

    assert_redirected_to word_count_url(@word_count_file.word_count_id)
  end

  test "should show word_count_file" do
    get word_count_word_count_file_url(@word_count_file.word_count_id, @word_count_file)
    assert_response :ok
  end

  test "should get edit" do
    get edit_word_count_word_count_file_url(@word_count_file.word_count_id, @word_count_file)
    assert_response :ok
  end

  test "should update word_count_file" do
    patch word_count_word_count_file_url(@word_count_file.word_count_id, @word_count_file), params: { word_count_file: {
      actual_word_count: @word_count_file.actual_word_count + 1,
      notes: "edited note",
      work_file_id: work_files(:one).id,
      work_type_id: work_types(:one).id
    } }

    assert_redirected_to word_count_url(@word_count_file.word_count_id)
  end

  test "should destroy word_count_file" do
    assert_difference("WordCountFile.count", -1) do
      delete word_count_word_count_file_url(@word_count_file.word_count_id, @word_count_file)
    end

    assert_redirected_to word_count_url(@word_count_file.word_count_id)
  end
end
