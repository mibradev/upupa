module ApplicationHelper
  class Page
    class Section < Base
      def render(&block)
        @template.tag.section(class: "space-y-8") do
          @template.capture(self, &block)
        end
      end

      def header(&block)
        @header ||= Header.new(@template)
        @header.render(&block)
      end

      class Header < Base
        def render(&block)
          @template.tag.header(class: "flex justify-between items-start") do
            @template.capture(self, &block)
          end
        end

        def heading(content)
          @template.tag.h3(content, class: "text-xl font-bold")
        end

        def actions(&block)
          @actions ||= Actions.new(@template)
          @actions.render(&block)
        end

        class Actions < Base
          def render(&block)
            @template.tag.div(class: "flex text-sm font-medium text-orange-100 bg-gray-600 rounded") do
              @template.capture(self, &block)
            end
          end

          def new(url)
            @template.link_to("New", url, class: "py-2 px-4 hover:bg-gray-700 rounded")
          end
        end
      end
    end
  end
end
