module ApplicationHelper
  class Page
    class Heading < Base
      def render(content)
        @template.content_for(:page_heading, content)
        @template.page.title(content)
      end
    end
  end
end
