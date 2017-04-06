module RailsReactComponents
  module Components
    class Prop
      attr_reader :name

      def initialize(name, options)
        @name = name.to_sym
        @options = options
      end

      def build(component)
        if on.present?
          component.send(on).send(name)
        else
          component.send(name)
        end
      end

      def include_blank?
        options.fetch(:include_blank, true)
      end

      private

      attr_reader :options

      def on
        @on ||= options[:on] || options[:delegate]
      end
    end
  end
end
