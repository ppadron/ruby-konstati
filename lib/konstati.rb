require 'restclient'
require 'json'

require File.dirname(__FILE__) + '/konstati/account'
require File.dirname(__FILE__) + '/konstati/tests'

module Konstati

    VERSION = '0.2.0'

    def self.endpoint
        @endpoint ||= "https://api.konstati.co/v1"
    end

    def self.endpoint=(val)
        @endpoint = val
    end

    def self.username
        @username
    end

    def self.username=(val)
        @username = val
    end

    def self.apikey=(val)
        @apikey = val
    end

    def self.apikey
        @apikey
    end

    def self.resource(path)
        RestClient::Resource.new(@endpoint + path, @username, @apikey)
    end

    def self.request(method, path, params = {})
        JSON.parse(
          RestClient::Request.execute(
            :method   => method,
            :url      => endpoint + path,
            :payload  => params,
            :user     => @username,
            :password => @apikey
          )
        )
    end

end
