module PageHelper
  def page
    @page ||= Page.new(self)
  end
end
