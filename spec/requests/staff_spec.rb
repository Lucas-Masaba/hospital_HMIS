require 'rails_helper'

require 'json'

RSpec.describe 'POST /staffs', type: :request do
  let(:staff) { create(:staff) }
  let(:url) { '/staffs/sign_in' }
  let(:params) do
    {
      staff: {
        email: staff.email,
        password: staff.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params.to_json,
                headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns JWT token in authorization header' do
      expect(response.headers['authorization']).to be_present
    end
  end

  context 'when login params are incorrect' do
    before { post url }

    it 'returns unathorized status' do
      expect(response.status).to eq 401
    end
  end
end
