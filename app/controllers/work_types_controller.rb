class WorkTypesController < ApplicationController
  include Pundit
  layout "scaffold"

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = WorkType.all
    render "scaffold/index"
  end

  def show
    render "scaffold/show"
  end

  def new
    @resource = WorkType.new
    render "scaffold/new"
  end

  def edit
    render "scaffold/edit"
  end

  def create
    @resource = WorkType.new
    @resource.assign_attributes resource_params

    if @resource.save
      redirect_to @resource, notice: "Work type was successfully created"
    else
      render "scaffold/new"
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "Work type was successfully updated"
    else
      render "scaffold/edit"
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
    permitted_attributes @resource
  end
end
