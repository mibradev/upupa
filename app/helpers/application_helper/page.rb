module ApplicationHelper
  class Page
    def initialize(template)
      @template = template
    end

    def actions(...)
      Actions.new(@template).render(...)
    end

    def description_list(...)
      DescriptionList.new(@template).render(...)
    end

    def description(...)
      Description.new(@template).render(...)
    end

    def empty_collection(...)
      EmptyCollection.new(@template).render(...)
    end

    def form(...)
      Form.new(@template).render(...)
    end

    def heading(...)
      Heading.new(@template).render(...)
    end

    def section(...)
      Section.new(@template).render(...)
    end

    def table(...)
      Table.new(@template).render(...)
    end

    def title(...)
      Title.new(@template).render(...)
    end
  end
end
