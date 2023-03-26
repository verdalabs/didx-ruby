require 'json'
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
