require "active_support/concern"

module ActiveRecord
  module IndexHint
    module Model
      extend ActiveSupport::Concern

      module ClassMethods
        def use_index(*index_names)
          from "#{quoted_table_name} USE INDEX (#{index_names.join ", "})"
        end

        def ignore_index
        end

        def force_index
        end
      end
    end
  end
end
