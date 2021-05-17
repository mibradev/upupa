module PageHelper
  class Page < Base
    def title(content)
      @template.content_for(:page_title, content)
    end

    def description(content)
      @template.content_for(:page_description, content)
    end

    def header(&block)
      Header.new(@template).render(&block)
    end

    def table(&block)
      Table.new(@template).render(&block)
    end

    def empty_collection
      EmptyCollection.new(@template).render
    end

    def description_list(&block)
      DescriptionList.new(@template).render(&block)
    end

    def form(model: nil, scope: nil, url: nil, format: nil, **options, &block)
      Form.new(@template).render(model: model, scope: scope, url: url, format: format, **options, &block)
    end

    def section(&block)
      Section.new(@template).render(&block)
    end
  end
end
