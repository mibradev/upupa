class WordCountsController < ApplicationController
  include Pundit
  layout "scaffold"

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = resource_model.all
    render "scaffold/index"
  end

  def show
    render "scaffold/show"
  end

  def new
    @resource = resource_model.new
    render "scaffold/new"
  end

  def edit
    render "scaffold/edit"
  end

  def create
    @resource = resource_model.new
    @resource.assign_attributes resource_params
    @resource.user = current_user

    if @resource.save
      redirect_to @resource, notice: "Word count was successfully created"
    else
      render "scaffold/new"
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "Word count was successfully updated"
    else
      render "scaffold/edit"
    end
  end

  def destroy
    if @resource.destroy
      flash.notice = "Word count was successfully destroyed"
    else
      flash.alert = @resource.errors.full_messages.first
    end

    redirect_to action: :index
  end

  private

  def set_resource
    @resource = resource_model.find(params[:id])
  end

  def resource_params
    permitted_attributes @resource
  end

  def resource_model
    controller_name.classify.constantize
  end
end
