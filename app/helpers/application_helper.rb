# frozen_string_literal: true

module ApplicationHelper
  def page_title(title)
    title = "#{title} - Upupa" unless current_page?(root_path)
    content_for(:page_title, title)
  end
end
