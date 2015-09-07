require "active_support/concern"

module ActiveRecord
  module IndexHint
    module Model
      extend ActiveSupport::Concern

      module ClassMethods
        def use_index
        end

        def ignore_index
        end

        def force_index
        end
      end
    end
  end
end
