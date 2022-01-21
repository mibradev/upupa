module Authorization
  private

  def authorize_admin
    render_403 unless Current.user.admin?
  end

  def authorize_manager
    render_403 unless Current.user.manager?
  end

  def authorize_project_manager
    render_403 unless Current.user.project_manager?
  end

  def authorize_translator
    render_403 unless Current.user.translator?
  end

  def render_403
    render file: Rails.root.join("public/403.html"), layout: false, status: :forbidden
  end
end
