class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
  end

  def edit
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to @role, notice: "Role was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      redirect_to @role, notice: "Role was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @role.destroy
      redirect_to roles_url, notice: "Role was successfully destroyed"
    else
      redirect_to @role, alert: @role.errors.full_messages.first
    end
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
