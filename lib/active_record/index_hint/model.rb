require "active_support/concern"
require "active_support/core_ext"

module ActiveRecord
  module IndexHint
    module Model
      extend ActiveSupport::Concern

      module ClassMethods
        def use_index(*index_names)
          from "#{quoted_table_name} USE INDEX (#{index_names.join ", "})"
        end

        def ignore_index(*index_names)
        end

        def force_index(*index_names)
          index_names.compact!
          raise ActiveRecord::IndexHint::StatementInvalid.new "You have an error in your SQL syntax; Please, set index_namesff" if index_names.blank?
          from "#{quoted_table_name} FORCE INDEX (#{index_names.join ", "})"
        end
      end
    end
  end
end
