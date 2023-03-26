module DIDX
  class Key < Generic
    attr_reader :multibase_encoded_key

    private
    def parse_method_id
      @multibase_encoded_key = @method_id
    end

    def resolve ;end
  end
end