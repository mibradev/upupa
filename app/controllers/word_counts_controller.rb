class WordCountsController < ApplicationController
  layout "scaffold"

  before_action :set_word_count, only: [:edit, :update, :destroy]

  def index
    @word_counts = WordCount.all
  end

  def show
    @word_count = WordCount.includes(word_count_files: [:work_file, :work_type]).find(params[:id])
  end

  def new
    @word_count = WordCount.new
    @word_count.date = Date.current
  end

  def edit
  end

  def create
    @word_count = WordCount.new(word_count_params)
    @word_count.user = current_user

    if @word_count.save
      redirect_to @word_count, notice: "Word count was successfully created"
    else
      render :new
    end
  end

  def update
    if @word_count.update(word_count_params)
      redirect_to @word_count, notice: "Word count was successfully updated"
    else
      render :edit
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
    @word_count = WordCount.find(params[:id])
  end

  def word_count_params
    params.require(:word_count).permit(:date, :notes)
  end
end
