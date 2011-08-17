require 'json'

module Konstati
    class Account

        def self.initialize
            puts 'bola'
        end

        def self.info
            Konstati.request("get", "/account")
            # RestClient::Resource.new(Konstati::Config.endpoint + '/account', Konstati::Config.username, Konstati::Config.apikey).get
        end
    end
end
