module ApplicationHelper
  class Page
    class Section < Base
      def render(&block)
        @template.tag.section(class: "space-y-8") do
          @template.capture(self, &block)
        end
      end

      def header(&block)
        Header.new(@template).render(&block)
      end

      class Header < Base
        def render(&block)
          @template.tag.header(class: "flex justify-between items-start space-x-4") do
            @template.capture(self, &block)
          end
        end

        def heading(content)
          @template.tag.h3(content, class: "text-2xl font-bold")
        end

        def actions(&block)
          Actions.new(@template).render(&block)
        end

        class Actions < Base
          def render(&block)
            @template.tag.div(class: "flex bg-gray-700 rounded") do
              @template.capture(self, &block)
            end
          end

          def new(url)
            @template.link_to("New", url, class: "block py-2 px-4 text-sm font-medium tracking-widest text-orange-100 uppercase bg-gray-700 rounded shadow appearance-none cursor-pointer hover:bg-gray-600 hover:shadow-md focus:bg-gray-500 focus:shadow-md focus:outline-none")
          end
        end
      end
    end
  end
end
