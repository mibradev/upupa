class WorkTypesController < ApplicationController
  layout "scaffold"

  before_action :set_work_type, only: [:show, :edit, :update, :destroy]

  def index
    @resources = WorkType.all
  end

  def show
  end

  def new
    @resource = WorkType.new
  end

  def edit
  end

  def create
    @resource = WorkType.new(work_type_params)

    if @resource.save
      redirect_to(@resource, notice: "Work type was successfully created.")
    else
      render :new
    end
  end

  def update
    if @resource.update(work_type_params)
      redirect_to @resource, notice: "Work type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to work_types_url, notice: "Work type was successfully destroyed."
  end

  private

  def set_work_type
    @resource = WorkType.find(params[:id])
  end

  def work_type_params
    params.require(:work_type).permit(:name, :multiplicand)
  end
end
