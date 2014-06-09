module Gigya
  module RestAPI
    def self.get_user_info(oauth_token)
      url = Gigya.build_url(Gigya::URLS[:socialize], Gigya::URIS[:get_user_info])

      response = Gigya.connection.get(url, { oauth_token: oauth_token, format: 'json' })

      JSON.parse response.body
    end
  end
end
