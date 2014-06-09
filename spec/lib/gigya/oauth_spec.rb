require 'spec_helper'

describe Gigya::OAuth, :vcr do
  # My personal Gigya's account credencials
  #
  let(:client_id) { '3_gFcj1fwscY5OAQRTm94-eSGYBJ0YhktB0TOs6VW6AhvgvVXUbwS7TTYx6IzsPXnf' }
  let(:client_secret) { 'qFJmqCwwfozIeTiAmAwaY6i7m97pTBWXG658t4oJaw0=' }
  let(:oauth_callback_url) { 'https://localhost:3000/free-videos' }

  subject(:oauth) { Gigya::OAuth.new(client_id, client_secret, oauth_callback_url) }

  describe 'login' do
    let(:provider) { 'facebook' }

    subject(:login) { oauth.login(provider) }

    it 'returns the code in response location' do
      expect(login).to_not be_nil
    end
  end

  describe 'get_token' do
    let(:code) { 'VC1_F50D897E31731F1AF44AE277D8160B6C_6aJvnIvvupTDQY7kCagzPdcmXZE7EC4ICXlFoLTYdEiqCSc4ncBPf83Or3YMtA0s7CeYQqk0BMZDubbM-FulMjAb4NdZJoe4PDs7MtE34u5CEHkHveOjXaPoVoGKXhZkrSCfju0jsiP1xUDB_gmMxzaINKM3yzeqPs6gCCCByve2x23nNuzzJBYxNcoBvkDS' }

    subject(:get_token) { oauth.get_token(code) }

    it 'returns the oauth access token' do
      expect(get_token['access_token']).to_not be_nil
    end
  end
end
