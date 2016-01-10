# Arav

Arav is Ruby command-line too that generates a d3.js directed graph representation your rails project's active record relations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arav'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arav

## Usage

    $ arav generate ~/src/my_rails_project/app/model/

This will generate an arav.html showing your active record associations as a directed graph using d3.js.

#### Please Use Sane ActiveRecord/Ruby Conventions

`arav` assumes your ActiveRecord project follows sane Ruby/Rails conventions. Namely, each file in `app/models/**/*` defines only one activerecord model.  So don't
define two active record models `User` and `Accounts` in a single file called `app/models/user_and_accounts.rb`. Don't define your classes in single lines like this: 

```
class User < ActiveRecord; def greet; puts "Hi"; end; end
```

There are countless other ways you can break the `arav` parser, but if you use sane Ruby/Rails conventions, it should work.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/arav.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

