module ApplicationHelper
  class Page
    class Actions < Base
      def render(&block)
        @template.provide(:page_actions) do
          @template.capture(self, &block)
        end
      end

      def index(url)
        @template.link_to("Back", url, class: "block py-2 px-8 w-full text-sm font-medium text-left text-orange-300 bg-transparent appearance-none cursor-pointer hover:bg-gray-600")
      end

      def show(url)
        @template.link_to("Show", url, class: "block py-2 px-8 w-full text-sm font-medium text-left text-orange-300 bg-transparent appearance-none cursor-pointer hover:bg-gray-600")
      end

      def new(url)
        @template.link_to("New", url, class: "block py-2 px-8 w-full text-sm font-medium text-left text-orange-300 bg-transparent appearance-none cursor-pointer hover:bg-gray-600")
      end

      def edit(url)
        @template.link_to("Edit", url, class: "block py-2 px-8 w-full text-sm font-medium text-left text-orange-300 bg-transparent appearance-none cursor-pointer hover:bg-gray-600")
      end

      def destroy(url)
        @template.button_to("Destroy", url, class: "block py-2 px-8 w-full text-sm font-medium text-left text-orange-300 bg-transparent appearance-none cursor-pointer hover:bg-gray-600", method: :delete)
      end
    end
  end
end
