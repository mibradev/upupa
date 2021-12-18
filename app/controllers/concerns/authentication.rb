module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    unless (Current.user = User.find_by(id: session[:user_id]))
      session[:stored_location] = request.url
      redirect_to login_url, alert: I18n.t("sessions.unauthenticated")
    end
  end
end
