require "active_support/lazy_load_hooks"
require "active_record"

require "active_record/index_hint/version"
require "active_record/index_hint/errors"

ActiveSupport.on_load(:active_record) do
  require "active_record/index_hint/model"

  ActiveRecord::Base.send(:include, ActiveRecord::IndexHint::Model)
end
