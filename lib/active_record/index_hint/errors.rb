module ActiveRecord
  module IndexHint
    class Error < ::StandardError
    end

    class StatementInvalid < Error
    end
  end
end
