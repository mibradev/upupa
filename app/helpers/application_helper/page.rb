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

    def actions(&block)
      Actions.new(@template).render(&block)
    end

    def description_list(&block)
      DescriptionList.new(@template).render(&block)
    end

    def empty_collection
      EmptyCollection.new(@template).render
    end

    def form(model: nil, scope: nil, url: nil, format: nil, **options, &block)
      Form.new(@template).render(model: model, scope: scope, url: url, format: format, **options, &block)
    end

    def section(&block)
      Section.new(@template).render(&block)
    end

    def table(&block)
      Table.new(@template).render(&block)
    end
  end
end
