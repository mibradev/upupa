module PageHelper
  class Page < Base
    attr_accessor :title
    attr_accessor :description

    def index(collection)
      heading.for_index!(collection)
      actions.for_index!(collection)
      yield
    end

    def show(object)
      heading.for_show!(object)
      actions.for_show!(object)
      yield
    end

    def new(object)
      heading.for_new!(object)
      actions.for_new!(object)
      yield
    end

    def edit(object)
      heading.for_edit!(object)
      actions.for_edit!(object)
      yield
    end

    def heading
      @heading ||= Heading.new
    end

    def actions
      @actions ||= Actions.new
    end

    def table(&block)
      @table ||= Table.new(@template)
      @table.render(&block)
    end

    def empty_collection
      @empty_collection ||= EmptyCollection.new(@template)
      @empty_collection.render
    end

    def description_list(&block)
      @description_list ||= DescriptionList.new(@template)
      @description_list.render(&block)
    end

    def form(model: nil, scope: nil, url: nil, format: nil, **options, &block)
      @form ||= Form.new(@template)
      @form.render(model: model, scope: scope, url: url, format: format, **options, &block)
    end

    def section(&block)
      @section ||= Section.new(@template)
      @section.render(&block)
    end
  end
end
