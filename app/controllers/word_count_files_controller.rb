class WordCountFilesController < ApplicationController
  layout "scaffold"

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = WordCountFile.all
  end

  def show
  end

  def new
    @resource = WordCountFile.new
  end

  def edit
  end

  def create
    @resource = WordCountFile.new(resource_params)

    if @resource.save
      redirect_to @resource, notice: "Word count file was successfully created"
    else
      render :new
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "Word count file was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to word_count_files_url, notice: "Word count file was successfully destroyed"
  end

  private

  def set_resource
    @resource = WordCountFile.find(params[:id])
  end

  def resource_params
    params.require(:word_count_file).permit(:actual_word_count, :notes, :work_type_id)
  end
end
