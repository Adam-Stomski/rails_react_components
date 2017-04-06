# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_react_components/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_react_components"
  spec.version       = RailsReactComponents::VERSION
  spec.authors       = ["Adam Stomski"]
  spec.email         = ["adam.stomski@gmail.com"]

  spec.summary       = %q{Component objects for Rails and React}
  spec.description   = %q{Component objects for Rails and React}
  spec.homepage      = "https://github.com/Adam-Stomski/rails_react_components"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "react_on_rails"
end
