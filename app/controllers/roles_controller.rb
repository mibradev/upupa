class RolesController < ApplicationController
  before_action :authorize_admin
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
  end

  def show
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end
end
