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
      redirect_to work_file_url(@work_file), notice: I18n.t("notices.created", record: WorkFile.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @work_file.update(work_file_params)
      redirect_to work_file_url(@work_file), notice: I18n.t("notices.updated", record: WorkFile.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @work_file.destroy
      redirect_to work_files_url, notice: I18n.t("notices.destroyed", record: WorkFile.model_name.human)
    else
      redirect_to work_file_url(@work_file), alert: @work_file.errors.full_messages.first
    end
  end

  private

  def set_work_file
    @work_file = WorkFile.find(params[:id])
  end

  def work_file_params
    params.require(:work_file).permit(:name)
  end
end
