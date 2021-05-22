module PageHelper
  class Actions < Array
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
