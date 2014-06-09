require 'spec_helper'

describe Gigya::Utils do
  let(:client_id) { 'client_id' }
  let(:client_secret) { 'client_secret' }

  subject(:utils) { Gigya::Utils }

  context 'build_signature_params' do
    let(:base_url) { Gigya.build_url(Gigya::URLS[:ids], Gigya::URIS[:search]) }
    let(:query)    { 'select count(*) from accounts' }

    subject(:build_signature_params) { utils.build_signature_params(client_id, client_secret, base_url, query) }

    it 'returns signature params' do
      expect(build_signature_params.keys).to include(:apiKey, :nonce, :query, :timestamp, :sig)
    end
  end
end
