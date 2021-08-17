module ApplicationHelper
  class Page
    class EmptyCollection < Base
      def render
        @template.tag.div("No records found.", class: "py-32 px-8 text-center text-orange-100 bg-gray-600")
      end
    end
  end
end
