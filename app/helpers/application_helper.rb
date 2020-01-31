# frozen_string_literal: true

module ApplicationHelper
  def app_name
    Upupa.to_s
  end

  def page_title(title)
    title = "#{title} - #{app_name}" unless current_page?(root_path)
    content_for(:page_title, title)
  end
end
