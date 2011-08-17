require 'restclient'
require 'json'
require 'konstati/account'
require 'konstati/test'

module Konstati

    def self.endpoint
        @endpoint ||= "http://api.konstati.co/v1"
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

      begin
        response = RestClient::Request.execute(
          :method   => method,
          :url      => endpoint + path,
          :payload  => params,
          :user     => @username,
          :password => @apikey
        )
      rescue Exception => e
        puts e
        return false
      end

      JSON.parse(response)
    end

end
