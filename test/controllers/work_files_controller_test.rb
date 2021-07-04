require "test_helper"

class WorkFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
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
      post work_files_url, params: {work_file: {name: "new.doc"}}
    end

    assert_redirected_to work_file_url(WorkFile.last)
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
    patch work_file_url(@work_file), params: {work_file: {name: "edited.doc"}}
    assert_redirected_to work_file_url(@work_file)
  end

  test "should destroy work_file" do
    assert_difference("WorkFile.count", -1) do
      delete work_file_url(@work_file)
    end

    assert_redirected_to work_files_url
  end

  class InvalidParametersTest < ActionDispatch::IntegrationTest
    setup do
      sign_in users(:one)
      @work_file = work_files(:one)
    end

    test "should not create work_file" do
      post work_files_url, params: {work_file: {name: nil}}
      assert_response :unprocessable_entity
    end

    test "should not update work_file" do
      patch work_file_url(@work_file), params: {work_file: {name: nil}}
      assert_response :unprocessable_entity
    end
  end

  class UnauthenticatedTest < ActionDispatch::IntegrationTest
    teardown do
      assert_redirected_to new_user_session_url
    end

    test "should not get index" do
      get work_files_url
    end

    test "should not get new" do
      get new_work_file_url
    end

    test "should not create work_file" do
      post work_files_url
    end

    test "should not show work_file" do
      get work_file_url(1)
    end

    test "should not get edit" do
      get edit_work_file_url(1)
    end

    test "should not update work_file" do
      patch work_file_url(1)
    end

    test "should not destroy work_file" do
      delete work_file_url(1)
    end
  end
end
