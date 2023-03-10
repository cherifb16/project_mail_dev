# frozen_string_literal: true

module RailsAdmin
  class HashHelper
    def self.symbolize(obj)
      case obj
      when Array
        obj.each_with_object([]) do |val, res|
          res << case val
                 when Hash, Array then symbolize(val)
                 when String      then val.to_sym
                 else val
                 end
        end
      when Hash
        obj.each_with_object({}) do |(key, val), res|
          nkey = key.is_a?(String) ? key.to_sym : key
          nval =
            case val
            when Hash, Array then symbolize(val)
            when String      then val.to_sym
            else val
            end
          res[nkey] = nval
        end
      else
        obj
      end
    end
  end
end
