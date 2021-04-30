class WorkFilesController < ApplicationController
  layout "scaffold"

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = WorkFile.all
  end

  def show
  end

  def new
    @resource = WorkFile.new
  end

  def edit
  end

  def create
    @resource = WorkFile.new(resource_params)

    if @resource.save
      redirect_to @resource, notice: "Work file was successfully created"
    else
      render :new
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "Work file was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to work_files_url, notice: "Work file was successfully destroyed"
  end

  private

  def set_resource
    @resource = WorkFile.find(params[:id])
  end

  def resource_params
    params.require(:work_file).permit(:name)
  end
end
