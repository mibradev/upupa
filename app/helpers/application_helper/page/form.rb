module ApplicationHelper
  class Page
    class Form < Base
      def render(model: nil, scope: nil, url: nil, format: nil, **options, &block)
        options[:builder] = FormBuilder

        @template.form_with(model: model, scope: scope, url: url, format: format, **options) do |form|
          @template.tag.div(class: "space-y-4") do
            @template.concat form.errors
            @template.concat @template.capture(form, &block)
          end
        end
      end

      class FormBuilder < ActionView::Helpers::FormBuilder
        def errors
          return unless object&.errors&.any?

          @template.tag.div(class: "p-4 bg-red-700 rounded") do
            @template.tag.h4(class: "mb-2 font-medium text-red-300") do
              "#{@template.pluralize(object.errors.count, "error")} prohibited this record from being saved:"
            end +
              @template.tag.ul(class: "pl-4 list-disc list-inside text-sm font-medium text-red-100") do
                object.errors.each do |error|
                  @template.concat @template.tag.li(error.full_message)
                end
              end
          end
        end

        def label(method, text = nil, options = {}, &block)
          options[:class] = "block font-medium appearance-none"
          super
        end

        def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
          html_options[:class] = "block px-3 py-2 w-full text-gray-700 bg-white rounded border border-black border-opacity-25 appearance-none hover:border-opacity-90 focus:border-gray-700 focus:ring-1 focus:ring-gray-700 focus:outline-none"
          @template.tag.div(class: "space-y-2") { label(method) + super }
        end

        def date_field(method, options = {})
          options[:class] = "block px-3 py-2 w-full text-gray-700 bg-white rounded border border-black border-opacity-25 appearance-none hover:border-opacity-90 focus:border-gray-700 focus:ring-1 focus:ring-gray-700 focus:outline-none"
          @template.tag.div(class: "space-y-2") { label(method) + super }
        end

        def number_field(method, options = {})
          options[:class] = "block px-3 py-2 w-full text-gray-700 bg-white rounded border border-black border-opacity-25 appearance-none hover:border-opacity-90 focus:border-gray-700 focus:ring-1 focus:ring-gray-700 focus:outline-none"
          @template.tag.div(class: "space-y-2") { label(method) + super }
        end

        def text_area(method, options = {})
          options[:class] = "block px-3 py-2 w-full text-gray-700 bg-white rounded border border-black border-opacity-25 appearance-none hover:border-opacity-90 focus:border-gray-700 focus:ring-1 focus:ring-gray-700 focus:outline-none"
          @template.tag.div(class: "space-y-2") { label(method) + super }
        end

        def text_field(method, options = {})
          options[:class] = "block px-3 py-2 w-full text-gray-700 bg-white rounded border border-black border-opacity-25 appearance-none hover:border-opacity-90 focus:border-gray-700 focus:ring-1 focus:ring-gray-700 focus:outline-none"
          @template.tag.div(class: "space-y-2") { label(method) + super }
        end

        def submit(value = nil, options = {})
          options[:class] = "block py-2 px-4 text-sm font-medium tracking-widest text-orange-100 uppercase bg-gray-700 rounded shadow appearance-none cursor-pointer hover:bg-gray-600 hover:shadow-md focus:bg-gray-500 focus:shadow-md focus:outline-none"
          super
        end
      end
    end
  end
end
