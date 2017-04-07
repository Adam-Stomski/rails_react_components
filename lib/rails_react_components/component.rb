# frozen_string_literal: true

require_relative "components/prop"
require_relative "components/dsl"

module RailsReactComponents
  class Component
    extend RailsReactComponents::Components::Dsl

    def initialize(methods = {})
      @_methods = methods
    end

    def method_missing(method_name, *args)
      if respond_to_missing?(method_name)
        _methods[method_name]
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      _methods.key?(method_name.to_sym) || super
    end

    def component_options
      {
        props: props,
        id: self.class.id,
        html_options: self.class.html_options,
        trace: self.class.trace?,
        replay_console: self.class.replay_console?,
        raise_on_prerender_error: self.class.raise_on_prerender_error?,
        prerender: self.class.prerender?
      }
    end

    def props
      @props ||= {}.tap do |props_hash|
        self.class.props.each do |prop|
          prop_data = prop.build(self)

          if prop.include_blank? || prop_data.present?
            props_hash[prop.name] = prop_data
          end
        end
      end
    end

    def component
      @component ||= \
        if self.class.component.is_a?(Symbol)
          send(self.class.component)
        else
          self.class.component
        end
    end

    private

    attr_reader :_methods
  end
end
