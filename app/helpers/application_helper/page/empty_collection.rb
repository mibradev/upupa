module ApplicationHelper
  class Page
    class EmptyCollection < Base
      def render
        @template.tag.div("No records found.", class: "py-32 px-4 text-lg font-medium text-center text-orange-100 bg-gray-700")
      end
    end
  end
end
