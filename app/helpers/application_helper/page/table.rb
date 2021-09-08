module ApplicationHelper
  class Page
    class Table < Base
      def render(&block)
        @template.tag.div(class: "overflow-x-auto rounded shadow") do
          @template.tag.table(class: "w-full text-sm text-left text-gray-700 whitespace-nowrap bg-orange-50 divide-y divide-black divide-opacity-10") do
            @template.capture(self, &block)
          end
        end
      end

      def head(...)
        Head.new(@template).render(...)
      end

      def body(...)
        Body.new(@template).render(...)
      end

      class Head < Base
        def render(&block)
          @template.tag.thead do
            @template.capture(self, &block)
          end
        end

        def row(...)
          Row.new(@template).render(...)
        end

        class Row < Base
          def render(&block)
            @template.tag.tr { @template.capture(self, &block) }
          end

          def cell(content = nil)
            @template.tag.th(content, scope: "col", class: "p-4 font-medium")
          end
        end
      end

      class Body < Base
        def render(collection, &block)
          @template.tag.tbody(class: "divide-y divide-black divide-opacity-10") do
            collection.each do |member|
              @template.concat @template.capture(self, member, &block)
            end
          end
        end

        def row(...)
          Row.new(@template).render(...)
        end

        class Row < Base
          def render(&block)
            @template.tag.tr { @template.capture(self, &block) }
          end

          def cell(content)
            @template.tag.td(content, class: "p-4")
          end

          def actions(...)
            Actions.new(@template).render(...)
          end

          class Actions < Base
            def render(&block)
              @template.tag.td(class: "p-2 text-right") { @template.capture(self, &block) }
            end

            def show(url)
              @template.link_to("Show", url, class: "inline-block p-1 text-xs font-medium tracking-widest uppercase bg-transparent rounded appearance-none cursor-pointer hover:bg-black hover:bg-opacity-10")
            end

            def edit(url)
              @template.link_to("Edit", url, class: "inline-block p-1 text-xs font-medium tracking-widest uppercase bg-transparent rounded appearance-none cursor-pointer hover:bg-black hover:bg-opacity-10")
            end

            def destroy(url)
              @template.button_to("Destroy", url, class: "inline-block p-1 text-xs font-medium tracking-widest uppercase bg-transparent rounded appearance-none cursor-pointer hover:bg-black hover:bg-opacity-10", method: :delete, form_class: "inline-block")
            end
          end
        end
      end
    end
  end
end
