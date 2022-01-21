class WordCountFilesController < ApplicationController
  before_action :authorize_translator
  before_action :set_word_count
  before_action :set_word_count_file, only: [:show, :edit, :update, :destroy]

  def index
    @word_count_files = @word_count.word_count_files
  end

  def show
  end

  def new
    @word_count_file = @word_count.word_count_files.new
  end

  def edit
  end

  def create
    @word_count_file = @word_count.word_count_files.new(word_count_file_params)

    if @word_count_file.save
      redirect_to word_count_url(@word_count), notice: I18n.t("notices.created", record: WordCountFile.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @word_count_file.update(word_count_file_params)
      redirect_to word_count_url(@word_count), notice: I18n.t("notices.updated", record: WordCountFile.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @word_count_file.destroy
      redirect_to word_count_url(@word_count), notice: I18n.t("notices.destroyed", record: WordCountFile.model_name.human)
    else
      redirect_to word_count_file_url(@word_count_file), alert: @word_count_file.errors.full_messages.first
    end
  end

  private

  def set_word_count
    @word_count = Current.user.word_counts.find(params[:word_count_id])
  end

  def set_word_count_file
    @word_count_file = @word_count.word_count_files.find(params[:id])
  end

  def word_count_file_params
    params.require(:word_count_file).permit(:actual_word_count, :notes, :work_file_id, :work_type_id)
  end
end
