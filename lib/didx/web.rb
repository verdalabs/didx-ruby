# frozen_string_literal: true

require "cgi"
require "uri"
require "net/http"

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