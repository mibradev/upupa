module ApplicationHelper
  class Page
    class Heading < Base
      def render(content)
        @template.page.title(content)
        @template.tag.h1(content, class: "text-2xl font-bold")
      end
    end
  end
end
