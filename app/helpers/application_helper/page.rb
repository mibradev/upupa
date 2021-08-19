module ApplicationHelper
  class Page
    def initialize(template)
      @template = template
    end

    def title(content)
      @template.provide(:page_title, content)
    end

    def description(content)
      @template.provide(:page_description, content)
    end

    def heading(content)
      @template.provide(:page_heading, content)
    end

    def actions(&block)
      Actions.new(@template).render(&block)
    end

    def description_list(&block)
      @description_list ||= DescriptionList.new(@template)
      @description_list.render(&block)
    end

    def empty_collection
      @empty_collection ||= EmptyCollection.new(@template)
      @empty_collection.render
    end

    def form(model: nil, scope: nil, url: nil, format: nil, **options, &block)
      @form ||= Form.new(@template)
      @form.render(model: model, scope: scope, url: url, format: format, **options, &block)
    end

    def section(&block)
      @section ||= Section.new(@template)
      @section.render(&block)
    end

    def table(&block)
      @table ||= Table.new(@template)
      @table.render(&block)
    end
  end
end
