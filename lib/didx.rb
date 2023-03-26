# frozen_string_literal: true
require "didx/generic"
require "didx/document"
require "didx/web"
require "didx/key"

module DIDX

  class Error < StandardError; end

  REGISTRY = {
    "web" => DIDX::Web
  }.freeze

  def self.parse(did_string)
    did_method = parse_method(did_string)
    did_method_class = self::REGISTRY[did_method]
    did_method_class.new(did_string)
  end

  def self.parse_method(did_string)
    default_split(did_string)[1]
  end

  def self.default_split(did_string)
    did_string.split(":", 3)
  end

end

module Kernel
  def DIDX(did)
    if did.is_a?(DIDX::Generic)
      did
    elsif did = String.try_convert(did)
      DIDX.parse(did)
    else
      raise ArgumentError,
            "bad argument (expected DID object or DID string)"
    end
  end

  module_function :DIDX
end
