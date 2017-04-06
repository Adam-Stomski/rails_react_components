require "spec_helper"

RSpec.describe "Options component" do
  class OptionsComponent < RailsReactComponents::Component
    component :different_name

    id "component-id"

    html_option "color", "red"
    html_option "opacity", "0.5"

    prerender
    trace
    replay_console
    raise_on_prerender_error

    def different_name
      "JokeComponent"
    end
  end

  describe "#build" do
    it "calls react_component with all specified options" do
      component = OptionsComponent.new
      expect(component.component_options).to eq(
        {
          props: {},
          id: "component-id",
          html_options: {
            "color" => "red",
            "opacity" => "0.5"
          },
          trace: true,
          replay_console: true,
          raise_on_prerender_error: true,
          prerender: true
        }
      )
      expect(component.component).to eq "JokeComponent"
    end
  end
end
