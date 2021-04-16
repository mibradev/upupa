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
      redirect_to(@work_type, notice: "Work type was successfully created.")
    else
      render :new
    end
  end

  def update
    if @work_type.update(work_type_params)
      redirect_to @work_type, notice: "Work type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @work_type.destroy
    redirect_to work_types_url, notice: "Work type was successfully destroyed."
  end

  private
    def set_work_type
      @work_type = WorkType.find(params[:id])
    end

    def work_type_params
      params.require(:work_type).permit(:name, :multiplicand)
    end
end
