class Users::RolesController < ApplicationController
  before_action :authorize_admin
  before_action :set_user

  def create
    @user_role = @user.user_roles.new(role_params)

    if @user_role.save
      redirect_to @user, notice: I18n.t("notices.created", record: UserRole.model_name.human)
    end
  end

  def destroy
    if @user.roles.destroy(params[:id])
      redirect_to @user, notice: I18n.t("notices.destroyed", record: UserRole.model_name.human)
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
