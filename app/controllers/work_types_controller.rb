class WorkTypesController < ApplicationController
  layout "scaffold"

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

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
    @resource = WorkType.new(resource_params)

    if @resource.save
      redirect_to @resource, notice: "Work type was successfully created"
    else
      render :new
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "Work type was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    if @resource.destroy
      flash.notice = "Work type was successfully destroyed"
    else
      flash.alert = @resource.errors.full_messages.first
    end

    redirect_to work_types_url
  end

  private

  def set_resource
    @resource = WorkType.find(params[:id])
  end

  def resource_params
    params.require(:work_type).permit(:name, :multiplicand)
  end
end
