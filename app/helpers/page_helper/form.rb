module PageHelper
  class Form < Base
    def render(model: nil, scope: nil, url: nil, format: nil, **options, &block)
      options[:builder] = FormBuilder

      @template.form_with(model: model, scope: scope, url: url, format: format, **options) do |form|
        @template.tag.div(class: "space-y-4 sm:p-8 sm:text-gray-600 sm:bg-orange-50 sm:rounded sm:shadow") do
          @template.capture(form, &block)
        end
      end
    end

    class FormBuilder < ActionView::Helpers::FormBuilder
      def errors
        return unless object&.errors&.any?

        @template.tag.div(class: "p-4 bg-red-900 rounded") do
          @template.tag.h4(class: "mb-2 font-medium text-red-300") do
            "#{@template.pluralize(object.errors.count, 'error')} prohibited this record from being saved:"
          end +

          @template.tag.ul(class: "pl-4 list-disc list-inside text-red-200") do
            object.errors.each do |error|
              @template.concat @template.tag.li(error.full_message)
            end
          end
        end
      end

      def label(method, text = nil, options = {}, &block)
        options[:class] = "block font-medium"
        super
      end

      def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
        html_options[:class] = "block p-2 w-full bg-white rounded border focus:border-0 focus:shadow focus:outline-none"
        @template.tag.div(class: "space-y-2") { label(method) + super }
      end

      def date_field(method, options = {})
        options[:class] = "block py-2 px-3 w-full rounded border focus:border-0 focus:shadow focus:outline-none"
        @template.tag.div(class: "space-y-2") { label(method) + super }
      end

      def number_field(method, options = {})
        options[:class] = "block py-2 px-3 w-full rounded border focus:border-0 focus:shadow focus:outline-none"
        @template.tag.div(class: "space-y-2") { label(method) + super }
      end

      def text_area(method, options = {})
        options[:class] = "block py-2 px-3 w-full rounded border focus:border-0 focus:shadow focus:outline-none"
        @template.tag.div(class: "space-y-2") { label(method) + super }
      end

      def text_field(method, options = {})
        options[:class] = "block py-2 px-3 w-full rounded border focus:border-0 focus:shadow focus:outline-none"
        @template.tag.div(class: "space-y-2") { label(method) + super }
      end

      def submit(value = nil, options = {})
        options[:class] = "block py-2 px-4 text-orange-50 bg-gray-600 rounded cursor-pointer hover:bg-gray-700 focus:ring-2 focus:ring-gray-700 focus:ring-opacity-50 focus:outline-none"
        super
      end
    end
  end
end
