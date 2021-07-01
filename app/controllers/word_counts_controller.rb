class WordCountsController < ApplicationController
  before_action :set_word_count, only: [:show, :edit, :update, :destroy]

  def index
    @word_counts = current_user.word_counts
  end

  def show
  end

  def new
    @word_count = current_user.word_counts.new
    @word_count.date = Date.current
  end

  def edit
  end

  def create
    @word_count = current_user.word_counts.new(word_count_params)

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
      flash.notice = "Word count was successfully destroyed"
    else
      flash.alert = @word_count.errors.full_messages.first
    end

    redirect_to word_counts_url
  end

  private

  def set_word_count
    @word_count = current_user.word_counts.find(params[:id])
  end

  def word_count_params
    params.require(:word_count).permit(:date, :notes)
  end
end
