module ApplicationHelper
  def page
    @page ||= Page.new(self)
  end
end
