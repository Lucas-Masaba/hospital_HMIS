require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  # let(:url) { 'http://localhost:3000/staffs' }
  # let(:params) do
  #   {
  #     staff: {
  #       email: 'staff@example.com',
  #       password: 'password'
  #     }
  #   }
  # end

  # context 'when staff is unauthenticated' do
  #   before { post url, params: params }

  #   it 'returns 200' do
  #     expect(response.status).to eq 200
  #   end

  #   it 'returns a new staff' do
  #     expect(response.body).to match_schema('staff')
  #   end
  # end

  # context 'when staff already exists' do
  #   before do
  #     Fabricate :staff, email: params[:staff][:email]
  #     post url, params: params
  #   end

  #   it 'returns bad request status' do
  #     expect(response.status).to eq 400
  #   end

  #   it 'returns validation errors' do
  #     expect(json['errors'].first['title']).to eq('Bad Request')
  #   end
  # end
end