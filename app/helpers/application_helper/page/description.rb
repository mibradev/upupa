module ApplicationHelper
  class Page
    class Description < Base
      def render(content)
        @template.content_for(:page_description, content)
      end
    end
  end
end
