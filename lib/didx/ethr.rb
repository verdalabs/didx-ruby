# frozen_string_literal: true

# class DIDX::Ethr is a class that represents a DID Ethr.
# It follows the did:ethr specification:
# https://github.com/decentralized-identity/ethr-did-resolver/blob/master/doc/did-method-spec.md
module DIDX
  class Ethr < Generic
    attr_reader :eth_address
    def resolve; end

    def parse_method_id
      @eth_address = @method_id
    end
  end
end
