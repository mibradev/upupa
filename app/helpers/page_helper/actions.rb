module PageHelper
  class Actions
    attr_reader :index
    attr_reader :show
    attr_reader :new
    attr_reader :edit
    attr_reader :destroy

    delegate :empty?, to: :@urls

    def initialize
      @urls = []
    end

    def index=(url)
      @urls.push(url)
      @index = url
    end

    def show=(url)
      @urls.push(url)
      @show = url
    end

    def new=(url)
      @urls.push(url)
      @new = url
    end

    def edit=(url)
      @urls.push(url)
      @edit = url
    end

    def destroy=(url)
      @urls.push(url)
      @destroy = url
    end
  end
end
