class WorkFilesController < ApplicationController
  before_action :set_work_file, only: [:show, :edit, :update, :destroy]

  def index
    @work_files = WorkFile.all
  end

  def show
  end

  def new
    @work_file = WorkFile.new
  end

  def edit
  end

  def create
    @work_file = WorkFile.new(work_file_params)

    if @work_file.save
      redirect_to @work_file, notice: "Work file was successfully created"
    else
      render :new
    end
  end

  def update
    if @work_file.update(work_file_params)
      redirect_to @work_file, notice: "Work file was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    if @work_file.destroy
      flash.notice = "Work file was successfully destroyed"
    else
      flash.alert = @work_file.errors.full_messages.first
    end

    redirect_to work_files_url
  end

  private

  def set_work_file
    @work_file = WorkFile.find(params[:id])
  end

  def work_file_params
    params.require(:work_file).permit(:name)
  end
end
