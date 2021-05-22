module PageHelper
  class Actions < Array
    def for_index!(collection)
      push_new({ action: :new })
      push_index(collection.second_to_last) if collection.is_a?(Array)
      self
    end

    def for_show!(object)
      push_edit({ action: :edit })
      push_destroy({ action: :destroy })
      push_index(object.is_a?(Array) ? object.second_to_last : { action: :index })
    end

    def for_new!(object)
      push_index(object.is_a?(Array) ? object.second_to_last : { action: :index })
    end

    def for_edit!(object)
      push_show({ action: :show })
      push_destroy({ action: :destroy })
      push_index(object.is_a?(Array) ? object.second_to_last : { action: :index })
    end

    private

    def push_index(url)
      push({ body: "Back", url: url, html_options: {} })
    end

    def push_show(url)
      push({ body: "Show", url: url, html_options: {} })
    end

    def push_new(url)
      push({ body: "New", url: url, html_options: {} })
    end

    def push_edit(url)
      push({ body: "Edit", url: url, html_options: {} })
    end

    def push_destroy(url)
      push({ body: "Destroy", url: url, html_options: { method: :delete, data: { confirm: "Are you sure?" } } })
    end
  end
end
