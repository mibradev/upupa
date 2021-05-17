module PageHelper
  class Header < Base
    def heading(content)
      @template.tag.h2 content, class: "text-2xl font-bold"
    end

    def actions
      @template.tag.div(class: "flex text-sm font-medium text-orange-100 bg-gray-600 rounded") do
        yield Actions.new(@template)
      end
    end

    class Actions < Base
      def index(url)
        @template.link_to "Back", url, class: "py-2 px-4 hover:bg-gray-700 rounded"
      end

      def show(url)
        @template.link_to "Show", url, class: "py-2 px-4 hover:bg-gray-700 rounded"
      end

      def new(url)
        @template.link_to "New", url, class: "py-2 px-4 hover:bg-gray-700 rounded"
      end

      def edit(url)
        @template.link_to "Edit", url, class: "py-2 px-4 hover:bg-gray-700 rounded"
      end

      def destroy(url)
        @template.link_to "Destroy", url, method: :delete, data: { confirm: "Are you sure?" }, class: "py-2 px-4 hover:bg-gray-700 rounded"
      end
    end
  end
end
