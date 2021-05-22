module PageHelper
  class Heading < String
    def for_index!(collection)
      collection = collection.last if collection.is_a?(Array)
      replace collection.model_name.human.titleize.pluralize
    end

    def for_show!(object)
      object = object.last if object.is_a?(Array)
      replace object.model_name.human.titleize
    end

    def for_new!(object)
      object = object.last if object.is_a?(Array)
      replace "New #{object.model_name.human.titleize}"
    end

    def for_edit!(object)
      object = object.last if object.is_a?(Array)
      replace "Editing #{object.model_name.human.titleize}"
    end
  end
end
