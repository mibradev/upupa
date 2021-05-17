module PageHelper
  class Page < Base
    def header
      @template.tag.header(class: "flex justify-between items-start") do
        yield Header.new(@template)
      end
    end
  end
end
