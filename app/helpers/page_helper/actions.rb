module PageHelper
  class Actions < Array
    def for_index(collection)
      self.new = { action: :new }
      self.index = collection.second_to_last if collection.is_a?(Array)
    end

    def for_show(object)
      self.edit = { action: :edit }
      self.index = object.is_a?(Array) ? object.second_to_last : { action: :index }
    end

    def for_new(object)
      self.index = object.is_a?(Array) ? object.second_to_last : { action: :index }
    end

    def for_edit(object)
      self.show = { action: :show }
      self.index = object.is_a?(Array) ? object.second_to_last : { action: :index }
    end

    private

    def index=(url)
      push({ body: "Back", url: url, html_options: {} })
    end

    def show=(url)
      push({ body: "Show", url: url, html_options: {} })
    end

    def new=(url)
      push({ body: "New", url: url, html_options: {} })
    end

    def edit=(url)
      push({ body: "Edit", url: url, html_options: {} })
    end

    def destroy=(url)
      push({ body: "Destroy", url: url, html_options: { method: :delete, data: { confirm: "Are you sure?" } } })
    end
  end
end
