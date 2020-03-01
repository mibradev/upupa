# frozen_string_literal: true

module ApplicationHelper
  def page_title(title)
    title = "#{title} - #{I18n.t :app_name}" unless current_page?(root_path)
    content_for(:page_title, title)
  end

  def page_description(content)
    content_for(:page_description, content)
  end
end
