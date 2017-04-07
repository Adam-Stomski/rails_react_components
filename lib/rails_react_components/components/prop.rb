module RailsReactComponents
  module Components
    class Prop
      def initialize(method_name, options)
        @method_name = method_name.to_sym
        @options = options
      end

      def build(component)
        if on.present?
          component.send(on).send(method_name)
        else
          component.send(method_name)
        end
      end

      def include_blank?
        options.fetch(:include_blank, true)
      end

      def name
        if as.present?
          as
        elsif RailsReactComponents.camelize_props
          method_name.to_s.camelize(:lower).to_sym
        else
          method_name
        end
      end

      private

      attr_reader :options, :method_name

      def on
        options[:on] || options[:delegate]
      end

      def as
        options.fetch(:as, nil)&.to_sym
      end
    end
  end
end
