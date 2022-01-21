class WordCountsController < ApplicationController
  before_action :authorize_translator
  before_action :set_word_count, only: [:show, :edit, :update, :destroy]

  def index
    @word_counts = Current.user.word_counts
  end

  def show
  end

  def new
    @word_count = Current.user.word_counts.new
    @word_count.date = Date.current
  end

  def edit
  end

  def create
    @word_count = Current.user.word_counts.new(word_count_params)

    if @word_count.save
      redirect_to word_count_url(@word_count), notice: I18n.t("notices.created", record: WordCount.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @word_count.update(word_count_params)
      redirect_to word_count_url(@word_count), notice: I18n.t("notices.updated", record: WordCount.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @word_count.destroy
      redirect_to word_counts_url, notice: I18n.t("notices.destroyed", record: WordCount.model_name.human)
    else
      redirect_to word_count_url(@word_count), alert: @word_count.errors.full_messages.first
    end
  end

  private

  def set_word_count
    @word_count = Current.user.word_counts.find(params[:id])
  end

  def word_count_params
    params.require(:word_count).permit(:date, :notes)
  end
end
