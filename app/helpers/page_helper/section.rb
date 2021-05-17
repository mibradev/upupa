module PageHelper
  class Section < Base
    def header
      @template.tag.header(class: "flex justify-between items-start") do
        yield Header.new(@template)
      end
    end

    class Header < Base
      def heading(content)
        @template.tag.h3 content, class: "text-xl font-bold"
      end

      def actions
        @template.tag.div(class: "flex text-sm font-medium text-orange-100 bg-gray-600 rounded") do
          yield Actions.new(@template)
        end
      end

      class Actions < Base
        def new(url)
          @template.link_to "New", url, class: "py-2 px-4 hover:bg-gray-700 rounded"
        end
      end
    end
  end
end
