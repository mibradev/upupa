class WorkTypesController < ApplicationController
  before_action :set_work_type, only: [:show, :edit, :update, :destroy]

  def index
    @work_types = WorkType.all
  end

  def show
  end

  def new
    @work_type = WorkType.new
  end

  def edit
  end

  def create
    @work_type = WorkType.new(work_type_params)

    if @work_type.save
      redirect_to @work_type, notice: I18n.t("notices.created", record: WorkType.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @work_type.update(work_type_params)
      redirect_to @work_type, notice: I18n.t("notices.updated", record: WorkType.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @work_type.destroy
      redirect_to work_types_url, notice: I18n.t("notices.destroyed", record: WorkType.model_name.human)
    else
      redirect_to @work_type, alert: @work_type.errors.full_messages.first
    end
  end

  private

  def set_work_type
    @work_type = WorkType.find(params[:id])
  end

  def work_type_params
    params.require(:work_type).permit(:name, :multiplicand)
  end
end
