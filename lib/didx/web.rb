# frozen_string_literal: false

require "cgi"
require "uri"
require "net/http"

# class DIDX::Web is a class that represents a DID Web.
# It is instantiated with a DID Web string.
# It resolves the DID Web to a DID Document assuming the
# uri location is available and valid

module DIDX
  class Web < Generic
    attr_reader :document_uri

    private
    def resolve
      response = Net::HTTP.get_response(document_uri)
      raise Error, "DID Document not found: #{response.inspect} for #{did.inspect}" unless response.is_a?(Net::HTTPSuccess)

      response.body
    end

    def parse_method_id
      did_escaped_path = method_id.gsub(":", "/")
      did_path = CGI.unescape(did_escaped_path)
      uri = URI("https://#{did_path}")
      uri.path = "/.well-known" if uri.path.empty?
      uri.path << "/did.json"
      @document_uri = uri
    end

  end
end