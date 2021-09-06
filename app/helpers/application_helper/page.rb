module ApplicationHelper
  class Page
    def initialize(template)
      @template = template
    end

    def title(content)
      @template.content_for(:page_title, content)
    end

    def description(content)
      @template.content_for(:page_description, content)
    end

    def heading(content)
      @template.content_for(:page_heading, content)
      title(content)
    end

    def actions(...)
      Actions.new(@template).render(...)
    end

    def description_list(...)
      DescriptionList.new(@template).render(...)
    end

    def empty_collection(...)
      EmptyCollection.new(@template).render(...)
    end

    def form(...)
      Form.new(@template).render(...)
    end

    def section(...)
      Section.new(@template).render(...)
    end

    def table(...)
      Table.new(@template).render(...)
    end
  end
end
