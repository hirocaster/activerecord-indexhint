# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_record/index_hint/version"

Gem::Specification.new do |spec|
  spec.name          = "activerecord-indexhint"
  spec.version       = ActiveRecord::IndexHint::VERSION
  spec.authors       = ["hirocaster"]
  spec.email         = ["hohtsuka@gmail.com"]
  spec.summary       = "Add index hints method(use/ignore/force index) to ActiveRecord"
  spec.description   = "Add index hints method(use/ignore/force index) to ActiveRecord"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.0"

  spec.add_dependency "activerecord", ">= 4.1.0"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "database_rewinder"
end
