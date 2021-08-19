module ApplicationHelper
  class Page
    class Table < Base
      def render(&block)
        @template.tag.div(class: "overflow-x-auto rounded shadow") do
          @template.tag.table(class: "w-full whitespace-nowrap") do
            @template.capture(self, &block)
          end
        end
      end

      def head(&block)
        Head.new(@template).render(&block)
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
        Actions.new(@template).render(&block)
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
          @template.link_to("Show", url, class: "inline-block px-2 text-sm font-medium bg-transparent rounded appearance-none cursor-pointer hover:text-gray-500")
        end

        def edit(url)
          @template.link_to("Edit", url, class: "inline-block px-2 text-sm font-medium bg-transparent rounded appearance-none cursor-pointer hover:text-gray-500")
        end

        def destroy(url)
          @template.button_to("Destroy", url, class: "inline-block px-2 text-sm font-medium bg-transparent rounded appearance-none cursor-pointer hover:text-gray-500", method: :delete, form_class: "inline-block")
        end
      end
    end
  end
end
