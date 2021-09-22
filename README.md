# BattingAvg

A Ruby gem to parse input CSV and out put batting average of batters.

## Installation (Locally)

- Setup up latest version of ruby on the machine (3.0.1)
- Build the gem from source with following command (make sure you are in project root directory)

    ```ruby
    gem build batting_avg.gemspec
    ```
- This will create a file named ```batting_avg-0.1.0.gem```
- Gem is now ready to use, it comes with the following CLI command

```ruby
batting average <file-path>.csv --year=2018 --team="Team Name"
```

> NOTE: `year` and `team` flags are optional


## Usage

```ruby
batting average /files/Batting.csv --year=1892 --team="Detroit Tigers"
```

### Example Output

Array of Hashes, similar to this:

```ruby
[
  {"playerID"=>"earlebi01", "yearId"=>"1892", "Team Name (s)"=>"Pittsburgh Pirates", "Batting Average"=>0.538},
  {"playerID"=>"inksbe01", "yearId"=>"1892", "Team Name (s)"=>"Brooklyn Dodgers, Washington Nationals", "Batting Average"=>0.371},
  {"playerID"=>"buffich01", "yearId"=>"1892", "Team Name (s)"=>"Baltimore Orioles", "Batting Average"=>0.349},
  {"playerID"=>"broutda01", "yearId"=>"1892", "Team Name (s)"=>"Brooklyn Dodgers", "Batting Average"=>0.335},
  {"playerID"=>"foremfr01", "yearId"=>"1892", "Team Name (s)"=>"Washington Nationals, Baltimore Orioles", "Batting Average"=>0.333},
  {"playerID"=>"carpehi01", "yearId"=>"1892", "Team Name (s)"=>"St. Louis Cardinals", "Batting Average"=>0.333}
]
```

> NOTE: Results are only sorted when filters are applied.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/batting_avg. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/batting_avg/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BattingAvg project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/batting_avg/blob/master/CODE_OF_CONDUCT.md).
