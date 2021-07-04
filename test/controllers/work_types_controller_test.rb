require "test_helper"

class WorkTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @work_type = work_types(:one)
  end

  test "should get index" do
    get work_types_url
    assert_response :ok
  end

  test "should get new" do
    get new_work_type_url
    assert_response :ok
  end

  test "should create work_type" do
    assert_difference("WorkType.count") do
      post work_types_url, params: {work_type: {name: "New Work Type", multiplicand: @work_type.multiplicand}}
    end

    assert_redirected_to work_type_url(WorkType.last)
  end

  test "should show work_type" do
    get work_type_url(@work_type)
    assert_response :ok
  end

  test "should get edit" do
    get edit_work_type_url(@work_type)
    assert_response :ok
  end

  test "should update work_type" do
    patch work_type_url(@work_type), params: {work_type: {name: "Edited Work Type", multiplicand: @work_type.multiplicand}}
    assert_redirected_to work_type_url(@work_type)
  end

  test "should destroy work_type" do
    assert_difference("WorkType.count", -1) do
      delete work_type_url(@work_type)
    end

    assert_redirected_to work_types_url
  end

  class InvalidParametersTest < ActionDispatch::IntegrationTest
    setup do
      sign_in users(:one)
      @work_type = work_types(:one)
    end

    test "should not create work_type" do
      post work_types_url, params: {work_type: {name: nil}}
      assert_response :unprocessable_entity
    end

    test "should not update work_type" do
      patch work_type_url(@work_type), params: {work_type: {name: nil}}
      assert_response :unprocessable_entity
    end
  end

  class UnauthenticatedTest < ActionDispatch::IntegrationTest
    teardown do
      assert_redirected_to new_user_session_url
    end

    test "should not get index" do
      get work_types_url
    end

    test "should not get new" do
      get new_work_type_url
    end

    test "should not create work_type" do
      post work_types_url
    end

    test "should not show work_type" do
      get work_type_url(1)
    end

    test "should not get edit" do
      get edit_work_type_url(1)
    end

    test "should not update work_type" do
      patch work_type_url(1)
    end

    test "should not destroy work_type" do
      delete work_type_url(1)
    end
  end
end
