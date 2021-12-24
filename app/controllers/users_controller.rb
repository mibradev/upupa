class UsersController < ApplicationController
  before_action :authorize_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: I18n.t("notices.created", record: User.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: I18n.t("notices.updated", record: User.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_url, notice: I18n.t("notices.destroyed", record: User.model_name.human)
    else
      redirect_to @user, alert: @user.errors.full_messages.first
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
