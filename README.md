# I18nExtract

This gem adds a new rake task 'i18n-extract:check' to your rails app.
It then highlights and raises an error when it finds hard-coded strings in your
views. Whitespace is ignored.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'i18n_extract'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n_extract

## Usage

Simply run:

```sh
bundle exec rake i18n-extract:check
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec ruby test/erb_files_test.rb` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TheNeikos/i18n_extract.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
