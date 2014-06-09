require 'spec_helper'

describe Gigya::RestAPI, :vcr do
  describe 'get_user_info' do
    let(:access_token) { 'AT3_6FD2D75D160E0D9F7810F1B9457D4405_YY1ANSoPTO_ur36ryKIv3p3gT3b8WBkfpE0YFME8vppnUKS-O2H8GtwSc3ThCIcpSDr9HyW_ftNpdgjCvnw5uTO84B2pmuSBBQoP6w8H_cC00IHUmH-xfDWrEz8r1baY' }

    subject(:get_user_info) { Gigya::RestAPI.get_user_info(access_token) }

    it 'returns the user infos' do
      user = get_user_info

      expect(user['email']).to eq 'johalfdevelopment@gmail.com'
      expect(user['nickname']).to eq 'Johalf Development'
    end
  end
end
