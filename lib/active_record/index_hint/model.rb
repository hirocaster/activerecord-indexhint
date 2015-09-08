require "active_support/concern"
require "active_support/core_ext"

module ActiveRecord
  module IndexHint
    module Model
      extend ActiveSupport::Concern

      module ClassMethods
        def use_index(*index_names)
          from_index :use, *index_names
        end

        def ignore_index(*index_names)
          ignore_indexes = validate_index_lists(*index_names)
          from_index :ignore, *ignore_indexes
        end

        def force_index(*index_names)
          force_indexes = validate_index_lists(*index_names)
          from_index :force, *force_indexes
        end

        private

          def validate_index_lists(*index_names)
            index_lists = index_names.compact
            raise ActiveRecord::IndexHint::StatementInvalid, "You have an error in your SQL syntax; Please, set index_names" if index_lists.blank?
            index_lists
          end

          def from_index(index_hint, *index_lists)
            from "#{quoted_table_name} #{index_hint.upcase} INDEX (#{index_lists.join ', '})"
          end
      end
    end
  end
end
