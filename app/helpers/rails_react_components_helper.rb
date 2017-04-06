module RailsReactComponentsHelper
  def render_react_component(klass, options = {})
    component = klass.new(options)
    react_component(component.component, component.component_options)
  end
end
