# frozen_string_literal: true

require "json"

# class DIDX::Document is a class that represents a DID Document.
# It is instantiated with a JSON string that conforms to the
# DID Document specification:
# https://w3c.github.io/did-core/#did-documents
module DIDX
  class Document
    attr_reader :document, :id, :context, :service,
                :verification_method, :authentication, :assertion_method

    def initialize(document_json_string)
      @document = JSON.parse(document_json_string)
      @context = document["@context"]
      @id = document["id"]
      @service = document["service"]
      @verification_method = document["verificationMethod"]
      @authentication = document["authentication"]
      @assertion_method = document["assertionMethod"]
    end
  end
end
