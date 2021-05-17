module PageHelper
  class DescriptionList < Base
    def group(term, description)
      @template.tag.div(class: "p-4 sm:grid sm:grid-cols-3 sm:gap-4") do
        @template.tag.dt(term, class: "text-sm font-medium text-gray-500") +
        @template.tag.dd(description, class: "mt-1 text-sm text-gray-900 sm:col-span-2 sm:mt-0")
      end
    end
  end
end
