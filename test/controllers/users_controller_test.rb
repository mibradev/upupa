require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in users(:admin)
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :ok
  end

  test "should get new" do
    get new_user_url
    assert_response :ok
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: {user: {email: "new@upupa.test"}}
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :ok
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :ok
  end

  test "should update user" do
    patch user_url(@user), params: {user: {email: @user.email}}
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test "should not destroy user with dependent word_count" do
    @user.word_counts << word_counts(:one)
    delete user_url(@user)
    assert_redirected_to user_url(@user)
  end

  class InvalidParametersTest < ActionDispatch::IntegrationTest
    setup do
      log_in users(:admin)
      @user = users(:one)
    end

    test "should not create user" do
      post users_url, params: {user: {email: nil}}
      assert_response :unprocessable_entity
    end

    test "should not update user" do
      patch user_url(@user), params: {user: {email: nil}}
      assert_response :unprocessable_entity
    end
  end

  class AuthorizationTest < ActionDispatch::IntegrationTest
    setup do
      log_in users(:with_password)
    end

    test "should not get index" do
      get users_url
      assert_response :forbidden
    end

    test "should not get new" do
      get new_user_url
      assert_response :forbidden
    end

    test "should not create user" do
      post users_url
      assert_response :forbidden
    end

    test "should not show user" do
      get user_url(1)
      assert_response :forbidden
    end

    test "should not get edit" do
      get edit_user_url(1)
      assert_response :forbidden
    end

    test "should not update user" do
      patch user_url(1)
      assert_response :forbidden
    end

    test "should not destroy user" do
      delete user_url(1)
      assert_response :forbidden
    end
  end
end
