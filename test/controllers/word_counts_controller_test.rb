require "test_helper"

class WordCountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:has_many_word_counts)
    @word_count = word_counts(:one)
  end

  test "should get index" do
    get word_counts_url
    assert_response :ok
  end

  test "should get new" do
    get new_word_count_url
    assert_response :ok
  end

  test "should create word_count" do
    assert_difference("WordCount.count") do
      post word_counts_url, params: {word_count: {date: Date.current, notes: "new note"}}
    end

    assert_redirected_to word_count_url(WordCount.last)
  end

  test "should show word_count" do
    get word_count_url(@word_count)
    assert_response :ok
  end

  test "should get edit" do
    get edit_word_count_url(@word_count)
    assert_response :ok
  end

  test "should update word_count" do
    patch word_count_url(@word_count), params: {word_count: {date: Date.current, notes: "edited note"}}
    assert_redirected_to word_count_url(@word_count)
  end

  test "should destroy word_count" do
    assert_difference("WordCount.count", -1) do
      delete word_count_url(@word_count)
    end

    assert_redirected_to word_counts_url
  end

  class UnauthenticatedTest < ActionDispatch::IntegrationTest
    teardown do
      assert_redirected_to new_user_session_url
    end

    test "should not get index" do
      get word_counts_url
    end

    test "should not get new" do
      get new_word_count_url
    end

    test "should not create word_count" do
      post word_counts_url
    end

    test "should not show word_count" do
      get word_count_url(1)
    end

    test "should not get edit" do
      get edit_word_count_url(1)
    end

    test "should not update word_count" do
      patch word_count_url(1)
    end

    test "should not destroy word_count" do
      delete word_count_url(1)
    end
  end
end
