# Activerecord::Indexhint

Add method, index hint(use/ignore/force index) for ActiveRecord(MySQL).

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-indexhint'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-indexhint

## Usage

```ruby
class User < ActiveRecord::Base
end

index_name = "index_users_on_name"

User.use_index(index_name).where(name: "foo")
# => "SELECT `users`.* FROM `users` USE INDEX (index_users_on_name) WHERE `users`.`name` = 'foo'"

User.ignore_index(index_name).where(name: "foo")
# => "SELECT `users`.* FROM `users` IGNORE INDEX (index_users_on_name) WHERE `users`.`name` = 'foo'"

User.force_index(index_name).where(name: "foo")
# => "SELECT `users`.* FROM `users` FORCE INDEX (index_users_on_name) WHERE `users`.`name` = 'foo'"
```

## Contributing

1. Fork it ( http://github.com/hirocaster/activerecord-indexhint/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
