class SessionsController < ActionController::Base
  before_action :redirect_if_already_logged_in, only: [:new, :create]
  before_action :redirect_if_already_logged_out, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      log_in user
      redirect_to root_url, notice: I18n.t("sessions.logged_in")
    else
      flash.now.alert = I18n.t("sessions.invalid_credentials")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to login_url, notice: I18n.t("sessions.logged_out")
  end

  private

  def redirect_if_already_logged_in
    redirect_to root_url, alert: I18n.t("sessions.already_logged_in") if logged_in?
  end

  def redirect_if_already_logged_out
    redirect_to login_url, alert: I18n.t("sessions.already_logged_out") if logged_out?
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def logged_out?
    !logged_in?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end
end
