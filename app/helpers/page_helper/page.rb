module PageHelper
  class Page < Base
    def title(title)
      title = "#{title} - #{I18n.t :app_name}" unless @template.current_page?(@template.root_path)
      @template.content_for(:page_title, title)
    end

    def description(content)
      @template.content_for(:page_description, content)
    end

    def header
      @template.tag.header(class: "flex justify-between items-start") do
        yield Header.new(@template)
      end
    end

    def table
      @template.tag.div(class: "overflow-x-auto rounded shadow") do
        @template.tag.table(class: "w-full whitespace-nowrap") do
          yield Table.new(@template)
        end
      end
    end

    def empty_collection
      @template.tag.div "No records found.", class: "py-32 px-8 text-center text-orange-100 bg-gray-600"
    end

    def description_list
      @template.tag.dl(class: "text-gray-600 bg-orange-50 rounded divide-y divide-gray-300 shadow") do
        yield DescriptionList.new(@template)
      end
    end

    def form(model: nil, scope: nil, url: nil, format: nil, **options)
      options[:builder] = Form::FormBuilder

      @template.form_with(model: model, scope: scope, url: url, format: format, **options) do |form|
        @template.tag.div(class: "space-y-4 sm:p-8 sm:text-gray-600 sm:bg-orange-50 sm:rounded sm:shadow") do
          @template.concat form.errors
          yield form
        end
      end
    end

    def section
      @template.tag.section(class: "space-y-8") do
        yield Section.new(@template)
      end
    end
  end
end
