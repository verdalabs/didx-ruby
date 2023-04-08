# frozen_string_literal: true

# class DIDX::Key is a class that represents a DID Key.
# It is instantiated with a multibase encoded key string.

module DIDX
  class Key < Generic
    attr_reader :multibase_encoded_key

    private

    def parse_method_id
      @multibase_encoded_key = @method_id
    end

    def resolve; end
  end
end
