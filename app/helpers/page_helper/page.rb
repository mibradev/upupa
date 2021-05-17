module PageHelper
  class Page < Base
    def header
      @template.tag.header(class: "flex justify-between items-start") do
        yield Header.new(@template)
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
