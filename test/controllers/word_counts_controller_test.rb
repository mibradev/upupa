require "test_helper"

class WordCountsControllerTest < ActionDispatch::IntegrationTest
  setup do
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
      post word_counts_url, params: {word_count: {date: Date.current, notes: @word_count.notes}}
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
    patch word_count_url(@word_count), params: {word_count: {date: @word_count.date, notes: @word_count.notes}}
    assert_redirected_to word_count_url(@word_count)
  end

  test "should destroy word_count" do
    assert_difference("WordCount.count", -1) do
      delete word_count_url(@word_count)
    end

    assert_redirected_to word_counts_url
  end

  test "should not destroy word_count with dependent word_count_file" do
    @word_count.word_count_files << word_count_files(:one)
    delete word_count_url(@word_count)
    assert_redirected_to @word_count
  end

  class InvalidParametersTest < ActionDispatch::IntegrationTest
    setup do
      @word_count = word_counts(:one)
    end

    test "should not create word_count" do
      post word_counts_url, params: {word_count: {date: nil}}
      assert_response :unprocessable_entity
    end

    test "should not update word_count" do
      patch word_count_url(@word_count), params: {word_count: {date: nil}}
      assert_response :unprocessable_entity
    end
  end
end
