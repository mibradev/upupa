module PageHelper
  class Table < Base
    def head
      @template.tag.thead(class: "text-sm font-medium tracking-wider text-left uppercase text-orange-100 bg-gray-600") do
        @template.tag.tr { yield Head.new(@template) }
      end
    end

    def body(collection)
      @template.tag.tbody(class: "text-gray-600 align-top bg-orange-50 divide-y divide-gray-300") do
        collection.each do |member|
          @template.concat(@template.tag.tr { yield member })
        end
      end
    end

    def cell(content)
      @template.tag.td content, class: "p-4"
    end

    def actions
      @template.tag.td(class: "p-4 text-right") { yield Actions.new(@template) }
    end

    class Head < Base
      def cell(content = nil)
        @template.tag.th content, scope: "col", class: "py-2 px-4"
      end
    end

    class Actions < Base
      def show(url)
        @template.link_to "Show", url, class: "p-2 text-sm text-orange-50 bg-gray-600 rounded hover:bg-gray-700"
      end

      def edit(url)
        @template.link_to "Edit", url, class: "p-2 text-sm text-orange-50 bg-gray-600 rounded hover:bg-gray-700"
      end

      def destroy(url)
        @template.link_to "Destroy", url, method: :delete, data: { confirm: "Are you sure?" }, class: "p-2 text-sm text-orange-50 bg-gray-600 rounded hover:bg-gray-700"
      end
    end
  end
end
