class ScaffoldController < ApplicationController
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
    @resource = resource_model.new(resource_params)

    if @resource.save
      redirect_to @resource, notice: resource_notice
    else
      render "scaffold/new"
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: resource_notice
    else
      render "scaffold/edit"
    end
  end

  def destroy
    @resource.destroy
    redirect_to({ action: :index }, notice: resource_notice)
  end

  private

  def set_resource
    @resource = resource_model.find(params[:id])
  end

  def resource_params
    params.require(controller_name.singularize).permit(permitted_attributes)
  end

  def resource_model
    controller_name.classify.constantize
  end

  def resource_notice
    I18n.t("scaffold.#{action_name}.notice", resource: resource_model.model_name.human)
  end
end
