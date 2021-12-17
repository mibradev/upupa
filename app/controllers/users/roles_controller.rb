class Users::RolesController < ApplicationController
  before_action :authorize_admin
  before_action :set_user

  def create
    return if role_params[:role_id].blank?
    @user.roles << Role.find(role_params[:role_id])
    redirect_to @user, notice: "Role was successfully added"
  end

  def destroy
    if @user.roles.destroy(params[:id])
      redirect_to @user, notice: "Role was successfully removed"
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def role_params
    params.require(:role).permit(:role_id)
  end
end
