class WordCountFilesController < ApplicationController
  layout "scaffold"

  before_action :set_word_count_file, only: [:show, :edit, :update, :destroy]

  def index
    @word_count_files = WordCountFile.all
  end

  def show
  end

  def new
    @word_count_file = WordCountFile.new
  end

  def edit
  end

  def create
    @word_count_file = WordCountFile.new(word_count_file_params)

    if @word_count_file.save
      redirect_to @word_count_file, notice: "Word count file was successfully created"
    else
      render :new
    end
  end

  def update
    if @word_count_file.update(word_count_file_params)
      redirect_to @word_count_file, notice: "Word count file was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @word_count_file.destroy
    redirect_to word_count_files_url, notice: "Word count file was successfully destroyed"
  end

  private

  def set_word_count_file
    @word_count_file = WordCountFile.find(params[:id])
  end

  def word_count_file_params
    params.require(:word_count_file).permit(:actual_word_count, :notes, :work_file_id, :work_type_id)
  end
end
