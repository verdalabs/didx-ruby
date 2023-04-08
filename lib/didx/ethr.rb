# frozen_string_literal: true

require "eth"
# class DIDX::Ethr is a class that represents a DID Ethr.
# It follows the did:ethr specification:
# https://github.com/decentralized-identity/ethr-did-resolver/blob/master/doc/did-method-spec.md
module DIDX
  class Ethr < Generic
    CONTRACT_ADDRESS = "0xdca7ef03e98e0dc2b855be647c39abe984fcf21b"
    NETWORKS = %i[mainnet polygon ropsten rinkeby kovan goerli mumbai].freeze
    ALCHEMY_API = "https://eth-mainnet.g.alchemy.com/v2/#{ENV["ALCHEMY_API_KEY"]}"
    INFURA_API = "https://mainnet.infura.io/v3/#{ENV["INFURA_TOKEN"]}"
    attr_reader :eth_address

    def client
      @client ||= Eth::Client.create(INFURA_API)
    end

    def eth_balance
      client.get_balance(@eth_address)
    end

    private

    def resolve; end

    def parse_method_id
      @eth_address = @method_id
    end
  end
end
