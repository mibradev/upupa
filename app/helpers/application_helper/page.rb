module ApplicationHelper
  class Page
    attr_accessor :title
    attr_accessor :heading
    attr_accessor :actions

    def initialize(template)
      @template = template
      @actions = {}
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
