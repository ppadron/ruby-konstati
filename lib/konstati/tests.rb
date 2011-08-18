module Konstati

  class Tests

    def self.create(params)
      Konstati.request(:post, '/tests', params)
    end

    def self.find(params = {})
      Konstati.request(:get, '/tests', params)
    end

    def self.delete(id)
      Konstati.request(:delete, '/tests/' + id)
    end

    def self.get(id)
      Konstati.request(:get, '/tests/' + id)
    end

  end
end
