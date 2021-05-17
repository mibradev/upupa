module PageHelper
  class DescriptionList < Base
    def render(&block)
      @template.tag.dl(class: "text-gray-600 bg-orange-50 rounded divide-y divide-gray-300 shadow") do
        @template.capture(self, &block)
      end
    end

    def group(term, description)
      @template.tag.div(class: "p-4 sm:grid sm:grid-cols-3 sm:gap-4") do
        @template.tag.dt(term, class: "text-sm font-medium text-gray-500") +
        @template.tag.dd(description, class: "mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0")
      end
    end
  end
end
