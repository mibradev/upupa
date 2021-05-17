module PageHelper
  class Page < Base
    def header
      @template.tag.header(class: "flex justify-between items-start") do
        yield Header.new(@template)
      end
    end

    def table
      @template.tag.div(class: "overflow-x-auto rounded shadow") do
        @template.tag.table(class: "w-full whitespace-nowrap") do
          yield Table.new(@template)
        end
      end
    end

    def description_list
      @template.tag.dl(class: "text-gray-600 bg-orange-50 rounded divide-y divide-gray-300 shadow") do
        yield DescriptionList.new(@template)
      end
    end

    def section
      @template.tag.section(class: "space-y-8") do
        yield Section.new(@template)
      end
    end
  end
end
