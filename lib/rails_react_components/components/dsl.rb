module RailsReactComponents
  module Components
    module Dsl
      def props
        @_props ||= []
      end

      def prop(name, options = {})
        props << RailsReactComponents::Components::Prop.new(name, options)
      end

      def component(name = nil)
        if name.nil?
          @_component ||= self.name.demodulize
        else
          @_component = name
        end
      end

      def id(name = nil)
        if name.nil?
          @_id
        else
          @_id = name
        end
      end

      def html_options
        @_html_options ||= {}
      end

      def html_option(name, value)
        html_options[name] = value
      end

      %w(prerender trace replay_console raise_on_prerender_error).each do |method|
        define_method method do
          instance_variable_set("@_#{method}", true)
        end

        define_method "#{method}?" do
          instance_variable_get("@_#{method}")
        end
      end
    end
  end
end
