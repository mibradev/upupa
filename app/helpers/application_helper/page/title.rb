module ApplicationHelper
  class Page
    class Title < Base
      def render(content)
        @template.content_for(:page_title, content)
      end
    end
  end
end
