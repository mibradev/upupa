class Users::RolesController < ApplicationController
  before_action :authorize_admin
  before_action :set_user

  def create
    @role_assignment = @user.role_assignments.new(role_assignment_params)

    if @role_assignment.save
      redirect_to user_url(@user), notice: I18n.t("notices.created", record: RoleAssignment.model_name.human)
    else
      redirect_to user_url(@user), alert: @role_assignment.errors.full_messages.first
    end
  end

  def destroy
    if @user.roles.destroy(params[:id])
      redirect_to user_url(@user), notice: I18n.t("notices.destroyed", record: RoleAssignment.model_name.human)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def role_assignment_params
    params.require(:role_assignment).permit(:role_id)
  end
end
