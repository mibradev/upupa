module Authorization
  private

  def authorize_admin
    render_403 unless Current.user.admin?
  end

  def render_403
    render file: Rails.root.join("public/403.html"), layout: false, status: :forbidden
  end
end
