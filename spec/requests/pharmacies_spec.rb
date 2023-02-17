require 'rails_helper'

RSpec.describe '/pharmacies', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Pharmacy. As you add validations to Pharmacy, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      dispensed: 2
    }
  end

  let(:invalid_attributes) do
    {
      dispensed: nil
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PharmaciesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Pharmacy.create! valid_attributes
      get pharmacies_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      pharmacy = Pharmacy.create! valid_attributes
      get pharmacy_url(pharmacy), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Pharmacy' do
        expect do
          post pharmacies_url,
               params: { pharmacy: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Pharmacy, :count).by(1)
      end

      it 'renders a JSON response with the new pharmacy' do
        post pharmacies_url,
             params: { pharmacy: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Pharmacy' do
        expect do
          post pharmacies_url,
               params: { pharmacy: invalid_attributes }, as: :json
        end.to change(Pharmacy, :count).by(0)
      end

      it 'renders a JSON response with errors for the new pharmacy' do
        post pharmacies_url,
             params: { pharmacy: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          dispensed: 5
        }
      end

      it 'updates the requested pharmacy' do
        pharmacy = Pharmacy.create! valid_attributes
        patch pharmacy_url(pharmacy),
              params: { pharmacy: new_attributes }, headers: valid_headers, as: :json
        pharmacy.reload
        expect(pharmacy.dispensed).to eq(5)
      end

      it 'renders a JSON response with the pharmacy' do
        pharmacy = Pharmacy.create! valid_attributes
        patch pharmacy_url(pharmacy),
              params: { pharmacy: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the pharmacy' do
        pharmacy = Pharmacy.create! valid_attributes
        patch pharmacy_url(pharmacy),
              params: { pharmacy: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested pharmacy' do
      pharmacy = Pharmacy.create! valid_attributes
      expect do
        delete pharmacy_url(pharmacy), headers: valid_headers, as: :json
      end.to change(Pharmacy, :count).by(-1)
    end
  end
end
