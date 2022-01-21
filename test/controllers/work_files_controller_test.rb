require "test_helper"

class WorkFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in users(:with_password)
    @work_file = work_files(:one)
  end

  test "should get index" do
    get work_files_url
    assert_response :ok
  end

  test "should get new" do
    get new_work_file_url
    assert_response :ok
  end

  test "should create work_file" do
    assert_difference("WorkFile.count") do
      post work_files_url, params: {work_file: {name: "new"}}
    end

    assert_redirected_to work_file_url(WorkFile.last)
  end

  test "should not create work_file with invalid parameters" do
    post work_files_url, params: {work_file: {name: nil}}
    assert_response :unprocessable_entity
  end

  test "should show work_file" do
    get work_file_url(@work_file)
    assert_response :ok
  end

  test "should get edit" do
    get edit_work_file_url(@work_file)
    assert_response :ok
  end

  test "should update work_file" do
    patch work_file_url(@work_file), params: {work_file: {name: @work_file.name}}
    assert_redirected_to work_file_url(@work_file)
  end

  test "should not update work_file with invalid parameters" do
    patch work_file_url(@work_file), params: {work_file: {name: nil}}
    assert_response :unprocessable_entity
  end

  test "should destroy work_file" do
    assert_difference("WorkFile.count", -1) do
      delete work_file_url(@work_file)
    end

    assert_redirected_to work_files_url
  end

  test "should not destroy work_file with dependent word_count_file" do
    @work_file.word_count_files << word_count_files(:one)
    delete work_file_url(@work_file)
    assert_redirected_to work_file_url(@work_file)
  end
end
