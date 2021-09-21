module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    unless (Current.user = User.find_by(id: session[:user_id]))
      reset_session
      redirect_to login_url
    end
  end
end
