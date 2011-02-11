require "active_resource"

module Konstati

  VERSION = "0.1.0"

  class Base < ActiveResource::Base

    self.format = :json
    self.site = "http://api.devel.konstati.co/"
    self.headers['User-Agent'] = "Konstati Ruby Client v0.1"

    def self.authenticate(options)
      self.user = options[:username]
      self.password = options[:password]
    end

    def self.element_path(id, prefix_options = {}, query_options = nil)
      prefix_options, query_options = split_options(prefix_options) if query_options.nil?
      "#{prefix(prefix_options)}#{collection_name}/#{id}#{query_string(query_options)}"
    end

    def self.collection_path(prefix_options = {}, query_options = nil)
      prefix_options, query_options = split_options(prefix_options) if query_options.nil?
      "#{prefix(prefix_options)}#{collection_name}#{query_string(query_options)}"
    end
  end

  module Tests

    class Spamassassin < Base
      self.site = "http://api.devel.konstati.co/"
      self.collection_name = "tests/spamassassin"
      self.element_name = "spamassassin"
    end

  end

end
