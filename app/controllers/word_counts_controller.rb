class WordCountsController < ApplicationController
  before_action :set_word_count, only: [:show, :edit, :update, :destroy]

  def index
    @word_counts = WordCount.all
  end

  def show
  end

  def new
    @word_count = WordCount.new
    @word_count.date = Date.current
  end

  def edit
  end

  def create
    @word_count = WordCount.new(word_count_params)
    @word_count.user = User.first

    if @word_count.save
      redirect_to @word_count, notice: "Word count was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @word_count.update(word_count_params)
      redirect_to @word_count, notice: "Word count was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @word_count.destroy
      redirect_to word_counts_url, notice: "Word count was successfully destroyed"
    else
      redirect_to @word_count, alert: @word_count.errors.full_messages.first
    end
  end

  private

  def set_word_count
    @word_count = WordCount.find(params[:id])
  end

  def word_count_params
    params.require(:word_count).permit(:date, :notes)
  end
end
