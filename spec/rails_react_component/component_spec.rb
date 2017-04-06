require "spec_helper"

module RailsReactComponents
  RSpec.describe Component do
    describe "#method_missing" do
      context "when passed object as param" do
        context "and calling method with its name" do
          it "returns object" do
            object = double(:object)
            component = Component.new(object: object)
            expect(component.object).to be object
          end
        end

        context "and calling undefined method" do
          it "raises NoMethodError" do
            object = double(:object)
            component = Component.new(object: object)
            expect{ component.other_object }.to raise_error(NoMethodError)
          end
        end
      end

      context "when object is not passed and calling undefined method" do
        it "raises NoMethodError" do
          component = Component.new
          expect{ component.object }.to raise_error(NoMethodError)
        end
      end
    end

    describe "#respond_to_missing?" do
      context "when passed object as param" do
        context "and calling method with its name" do
          it "returns true" do
            object = double(:object)
            component = Component.new(object: object)
            expect(component.respond_to?(:object)).to eq true
          end
        end

        context "and calling with undefined name" do
          it "returns false" do
            object = double(:object)
            component = Component.new(object: object)
            expect(component.respond_to?(:other_object)).to eq false
          end
        end
      end

      context "when object is not passed and calling undefined method" do
        it "raises NoMethodError" do
          component = Component.new
          expect(component.respond_to?(:object)).to eq false
        end
      end
    end

    describe "#component" do
      context "when class component is not set" do
        it "returns class name" do
          component = Component.new
          expect(component.component).to eq "Component"
        end
      end

      context "when class component name is string" do
        it "returns name" do
          allow(Component).to receive(:component) { "MyComponent" }
          component = Component.new
          expect(component.component).to eq "MyComponent"
        end
      end

      context "when class component name is symbol" do
        it "calls method with symbol" do
          allow(Component).to receive(:component) { :component_name }
          component = Component.new
          allow(component).to receive(:component_name) { "HelloWorld" }
          expect(component.component).to eq "HelloWorld"
        end
      end
    end

    describe "#component_options" do
      it "returns default options" do
        component = Component.new

        expect(component.component_options).to eq(
          {
            props: {},
            id: nil,
            html_options: {},
            trace: nil,
            replay_console: nil,
            raise_on_prerender_error: nil,
            prerender: nil
          }
        )
      end
    end
  end
end
