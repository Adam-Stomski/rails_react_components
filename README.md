# RailsReactComponents

Component objects for Rails and React

```ruby
# component class
class MyComponent < RailsReactComponents::Component
  prop :name
  prop :email, on: :user
  prop :is_ready

  def name
    "My name is Rails Component"
  end

  def is_ready
    user.ready?
  end
end

# in view this can run:
# react_component("MyComponent", 
#   props: { 
#     name: "My name is Rails Component",
#     email: "user@example.com",
#     is_ready: true
#   }
# )
render_react_component MyComponent, user: current_user 
```

## TODO

- [ ] - nested props
- [ ] - Rspec matchers
- [ ] - configuration (snake_case methods for camelCase props etc)

## Installation

If you are not using `react_on_rails` yet check https://github.com/shakacode/react_on_rails

Add this line to your application's Gemfile:

```ruby
gem 'rails_react_components'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_react_components

## Usage


#### Available options example:
```ruby
  class MyComponent < RailsReactComponents::Component
    component "FilePicker"

    id "file-picker-id"

    html_option "color", "red"
    html_option "opacity", "0.5"

    prerender
    trace
    replay_console
    raise_on_prerender_error

    prop :blank, include_blank: false

    prop :name, on: :user
    prop :email, delegate: :user # alias

    def blank
      ""
    end
  end
```

check also [here](spec/features) and [here](https://github.com/shakacode/react_on_rails#react_component)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Adam-Stomski/rails_react_components.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

