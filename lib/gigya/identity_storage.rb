require 'hmac-sha1'

module Gigya
  class IdentityStorage
    attr_reader :client_id, :client_secret

    def initialize(client_id, client_secret)
      @base_url      = Gigya.build_url(Gigya::URLS[:ids], Gigya::URIS[:search])
      @client_id     = client_id
      @client_secret = client_secret
    end

    def search(query)
      params = build_params(@base_url, query)

      response = Gigya.connection.post do |request|
        request.url @base_url
        request.body = params
      end

      JSON.parse response.body
    end

    private

    def build_params(url, query)
      signature_params = Utils.build_signature_params(@client_id, @client_secret, @base_url, query)

      signature_params.merge!(query: query)
    end
  end
end
