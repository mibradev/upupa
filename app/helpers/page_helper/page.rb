module PageHelper
  class Page < Base
    attr_accessor :title
    attr_accessor :description
    attr_accessor :heading

    def index(collection)
      unless collection.is_a?(Array)
        self.heading = collection.model_name.human.titleize.pluralize
        actions.new = { action: :new }
      else
        self.heading = collection.last.model_name.human.titleize.pluralize
        actions.new = { action: :new }
        actions.index = collection.second_to_last
      end

      yield
    end

    def show(object)
      unless object.is_a?(Array)
        self.heading = object.model_name.human.titleize
        actions.edit = { action: :edit }
        actions.index = { action: :index }
      else
        self.heading = object.last.model_name.human.titleize
        actions.edit = { action: :edit }
        actions.index = object.second_to_last
      end

      yield
    end

    def new(object)
      unless object.is_a?(Array)
        self.heading = "New #{object.model_name.human.titleize}"
        actions.index = { action: :index }
      else
        self.heading = "New #{object.last.model_name.human.titleize}"
        actions.index = object.second_to_last
      end

      yield
    end

    def edit(object)
      unless object.is_a?(Array)
        self.heading = "Editing #{object.model_name.human.titleize}"
        actions.show = { action: :show }
        actions.index = { action: :index }
      else
        self.heading = "Editing #{object.last.model_name.human.titleize}"
        actions.show = { action: :show }
        actions.index = object.second_to_last
      end

      yield
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
