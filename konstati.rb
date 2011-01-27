require "active_resource"

module Konstati

  class Base < ActiveResource::Base

    self.format = :json
    self.site = "http://api.konstati.co/"

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

  class SpamTest < Base
    self.element_name = "spam-test"
  end

  class MatchedRule < Hash
    def initialize(rules)
      self.replace(rules) 
    end
  end

  class Message < Hash
    def initialize(properties)
      self.replace(properties)
    end
  end

end
