require 'spec_helper'

describe Gigya::IdentityStorage, :vcr do
  let(:client_id) { '3_gFcj1fwscY5OAQRTm94-eSGYBJ0YhktB0TOs6VW6AhvgvVXUbwS7TTYx6IzsPXnf' }
  let(:client_secret) { 'qFJmqCwwfozIeTiAmAwaY6i7m97pTBWXG658t4oJaw0=' }

  subject(:identity_storage) { Gigya::IdentityStorage.new(client_id, client_secret) }

  describe 'search' do
    let(:query) { "select * from accounts where lastUpdated < '2014-06-09T16:27:32Z'" }

    subject(:search) { identity_storage.search(query) }

    it 'returns the users infos' do
      search
    end
  end
end
