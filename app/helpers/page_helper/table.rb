module PageHelper
  class Table < Base
    def render(&block)
      @template.tag.div(class: "overflow-x-auto rounded shadow") do
        @template.tag.table(class: "w-full whitespace-nowrap") do
          @template.capture(self, &block)
        end
      end
    end

    def head(&block)
      @head ||= Head.new(@template)
      @head.render(&block)
    end

    def body(collection, &block)
      @template.tag.tbody(class: "text-gray-600 align-top bg-orange-50 divide-y divide-gray-300") do
        collection.each do |member|
          @template.concat(@template.tag.tr { @template.capture(member, &block) })
        end
      end
    end

    def cell(content)
      @template.tag.td(content, class: "p-4")
    end

    def actions(&block)
      @actions ||= Actions.new(@template)
      @actions.render(&block)
    end

    class Head < Base
      def render(&block)
        @template.tag.thead(class: "text-sm font-medium tracking-wider text-left uppercase text-orange-100 bg-gray-600") do
          @template.tag.tr { @template.capture(self, &block) }
        end
      end

      def cell(content = nil)
        @template.tag.th(content, scope: "col", class: "py-2 px-4")
      end
    end

    class Actions < Base
      def render(&block)
        @template.tag.td(class: "p-4 text-right") { @template.capture(self, &block) }
      end

      def show(url)
        @template.link_to("Show", url, class: "p-2 text-sm text-orange-50 bg-gray-600 rounded hover:bg-gray-700")
      end

      def edit(url)
        @template.link_to("Edit", url, class: "p-2 text-sm text-orange-50 bg-gray-600 rounded hover:bg-gray-700")
      end

      def destroy(url)
        @template.link_to("Destroy", url, class: "p-2 text-sm text-orange-50 bg-gray-600 rounded hover:bg-gray-700", method: :delete, data: {confirm: "Are you sure?"})
      end
    end
  end
end
