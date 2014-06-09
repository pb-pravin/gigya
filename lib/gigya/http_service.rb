require 'faraday'
require 'faraday_middleware'

module Gigya
  module HTTPService
    def self.connection
      Faraday.new do |faraday|
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
        faraday.response :json, content_type: 'application/json'
      end
    end
  end
end
