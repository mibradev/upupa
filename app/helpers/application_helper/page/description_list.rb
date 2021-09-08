module ApplicationHelper
  class Page
    class DescriptionList < Base
      def render(&block)
        @template.tag.dl(class: "text-gray-700 bg-orange-50 rounded divide-y divide-black divide-opacity-10 shadow") do
          @template.capture(self, &block)
        end
      end

      def group(&block)
        Group.new(@template).render(&block)
      end

      class Group < Base
        def render(&block)
          @template.tag.div(class: "p-4 sm:grid sm:grid-cols-4 sm:gap-4") do
            @template.capture(self, &block)
          end
        end

        def term(content)
          @template.tag.dt(content, class: "text-sm font-medium")
        end

        def description(content)
          @template.tag.dd(content, class: "mt-1 text-sm text-gray-700 text-opacity-90 sm:col-span-2 sm:mt-0")
        end
      end
    end
  end
end
