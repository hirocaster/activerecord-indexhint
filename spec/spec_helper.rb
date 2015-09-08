require "simplecov"
require "coveralls"
require "codeclimate-test-reporter"
Coveralls.wear!
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter,
  CodeClimate::TestReporter::Formatter
]
SimpleCov.start do
  add_filter "/spec"
  add_filter "/vendor"
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "activerecord-indexhint"
require "pry"
require "pry-byebug"
require "awesome_print"
require "database_rewinder"

require_relative "models"

log_directry = File.expand_path("../../log/", __FILE__)
Dir.mkdir log_directry unless Dir.exist? log_directry
ActiveRecord::Base.logger = Logger.new("#{log_directry}/test.log")

RSpec.configure do |config|
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed

  config.before(:suite) do
    ActiveRecord::Tasks::DatabaseTasks.db_dir = File.expand_path "..", __FILE__
    ActiveRecord::Tasks::DatabaseTasks.root   = File.expand_path "../..", __FILE__
    ActiveRecord::Tasks::DatabaseTasks.env    = "test"

    configuration = ActiveRecord::Base.configurations["test"]
    ActiveRecord::Tasks::DatabaseTasks.drop(configuration)
    ActiveRecord::Tasks::DatabaseTasks.create(configuration)

    ActiveRecord::Tasks::DatabaseTasks.load_schema_for configuration, :ruby

    DatabaseRewinder["test"]
  end

  config.after(:each) do
    DatabaseRewinder.clean
  end

  config.after(:suite) do
    configuration = ActiveRecord::Base.configurations["test"]
    ActiveRecord::Tasks::DatabaseTasks.drop(configuration)
  end
end
