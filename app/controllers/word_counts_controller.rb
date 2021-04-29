class WordCountsController < ApplicationController
  include Pundit
  layout "scaffold"

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  def index
    @resources = WordCount.all
  end

  def show
  end

  def new
    @resource = WordCount.new
  end

  def edit
  end

  def create
    @resource = WordCount.new
    @resource.assign_attributes resource_params
    @resource.user = current_user

    if @resource.save
      redirect_to @resource, notice: "Word count was successfully created"
    else
      render :new
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "Word count was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to word_counts_url, notice: "Word count was successfully destroyed"
  end

  private

  def set_resource
    @resource = WordCount.find(params[:id])
  end

  def resource_params
    permitted_attributes @resource
  end
end
