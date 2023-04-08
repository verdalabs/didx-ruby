# frozen_string_literal: true

# class DIDX::Generic
# This class is the base class for all DID methods.
# It is instantiated with a DID string that conforms to the
# DID specification:
# https://w3c.github.io/did-core/#did-syntax
# Subclasses must implement #resolve and #parse_method_id

require "didx/version"
require "didx/document"
module DIDX
  class Generic
    attr_reader :id, :prefix, :method, :method_id

    def initialize(did_string)
      @id = did_string
      @prefix, @method, @method_id = did_string.split(":", 3)
      parse_method_id
      raise Error, "Invalid DID: #{did_string.inspect}" unless @prefix == "did"

      @document = nil
    end

    def document
      @document ||= Document.new(resolve)
    end

    private

    def resolve
      raise NotImplementedError, "Subclass of DIDX::Generic must implement #resolve"
    end

    def parse_method_id; end
  end
end
