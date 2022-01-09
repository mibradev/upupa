class SessionsController < ActionController::Base
  before_action :redirect_if_already_logged_in, only: [:new, :create]
  before_action :redirect_if_already_logged_out, only: :destroy
  before_action :set_redirection_url, only: :create

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      log_in user
      redirect_to @redirection_url, notice: I18n.t("notices.sessions.logged_in")
    else
      flash.now.alert = I18n.t("alerts.sessions.invalid_credentials")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to login_url, notice: I18n.t("notices.sessions.logged_out")
  end

  private

  def redirect_if_already_logged_in
    redirect_to root_url, alert: I18n.t("alerts.sessions.already_logged_in") if logged_in?
  end

  def redirect_if_already_logged_out
    redirect_to login_url, alert: I18n.t("alerts.sessions.already_logged_out") if logged_out?
  end

  def set_redirection_url
    @redirection_url = session[:redirection_url] || root_url
  end

  def logged_in?
    User.exists? session[:user_id]
  end

  def logged_out?
    !logged_in?
  end

  def log_in(user)
    reset_session
    session[:user_id] = user.id
  end

  def log_out
    reset_session
  end
end
