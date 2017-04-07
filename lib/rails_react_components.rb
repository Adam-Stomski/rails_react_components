# frozen_string_literal: true

require "rails"
require "rails_react_components/engine"

module RailsReactComponents
  mattr_accessor :camelize_props
  self.camelize_props = true

  mattr_accessor :prerender
  self.prerender = nil

  mattr_accessor :raise_on_prerender_error
  self.raise_on_prerender_error = nil

  def self.config
    yield self
  end
end

require "rails_react_components/version"
require "rails_react_components/component"
