require 'spec_helper'

describe Gigya do
  describe 'connection' do
    subject { Gigya.connection }

    it { expect(subject).to be_kind_of(Faraday::Connection) }
  end
end
