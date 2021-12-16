class Users::RolesController < ApplicationController
  def create
    return if role_params[:role_id].blank?
    @user = User.find(params[:user_id])
    @user.roles << Role.find(role_params[:role_id])
    redirect_to @user, notice: "Role was successfully added"
  end

  private

  def role_params
    params.require(:role).permit(:role_id)
  end
end
