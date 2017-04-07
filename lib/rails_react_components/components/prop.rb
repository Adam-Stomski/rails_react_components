module RailsReactComponents
  module Components
    class Prop
      def initialize(prop_name, options)
        @prop_name = prop_name.to_sym
        @options = options
      end

      def build(component)
        if on.present?
          component.send(on).send(prop_name)
        else
          component.send(prop_name)
        end
      end

      def include_blank?
        options.fetch(:include_blank, true)
      end

      def name
        @name ||= options.fetch(:as, nil)&.to_sym || prop_name
      end

      private

      attr_reader :options, :prop_name

      def on
        @on ||= options[:on] || options[:delegate]
      end
    end
  end
end
