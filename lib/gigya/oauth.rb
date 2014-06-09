module Gigya
  class OAuth
    attr_reader :client_id, :client_secret, :oauth_callback_url

    def initialize(client_id, client_secret, oauth_callback_url = nil)
      @client_id          = client_id
      @client_secret      = client_secret
      @oauth_callback_url = oauth_callback_url
    end

    def login(provider)
      params = {
        client_id: @client_id,
        redirect_uri: @oauth_callback_url,
        response_type: 'code',
        x_provider: provider
      }

      url = Gigya.build_url(Gigya::URLS[:socialize], Gigya::URIS[:login])

      response = Gigya.connection.get(url, params)

      response['location']
    end

    def get_token(code)
      params = {
        client_id: @client_id,
        client_secret: @client_secret,
        redirect_uri: @oauth_callback_url,
        grant_type: 'authorization_code',
        code: code
      }

      url = Gigya.build_url(Gigya::URLS[:socialize], Gigya::URIS[:get_token])

      response = Gigya.connection.post(url, params)

      JSON.parse response.body
    end
  end
end
