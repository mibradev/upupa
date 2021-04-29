class WorkFilesController < ApplicationController
  include Pundit
  layout "scaffold"

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = WorkFile.all
    render "scaffold/index"
  end

  def show
    render "scaffold/show"
  end

  def new
    @resource = WorkFile.new
    render "scaffold/new"
  end

  def edit
    render "scaffold/edit"
  end

  def create
    @resource = WorkFile.new
    @resource.assign_attributes resource_params

    if @resource.save
      redirect_to @resource, notice: "Work file was successfully created"
    else
      render "scaffold/new"
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "Work file was successfully updated"
    else
      render "scaffold/edit"
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
    permitted_attributes @resource
  end
end
