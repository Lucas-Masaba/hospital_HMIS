require 'rails_helper'

RSpec.describe '/prescriptions', type: :request do
  let!(:patient) do
    Patient.create!(
      name: 'Kemigisa Diana',
      age: 12, gender: 'F',
      date_of_birth: '2023-01-23',
      address: 'Kampala',
      phone_number: 256_777_777_777,
      next_of_kin: 'Mwine Tom',
      next_of_kin_phone: 256_770_773_778,
      next_of_kin_address: 'Kampala'
    )
  end

  let!(:visit) do
    Visit.create!(
      visit_no: '2',
      visit_owner: 'Caitylyn',
      visit_date: '2023-01-23',
      visit_type: 'review',
      visit_category: 'insurance',
      speciality: 'cardiology',
      member_no: '2A5R2',
      service: 'Consultation',
      patient_id: patient.id
    )
  end

  let(:valid_attributes) do
    {
      product: 'Paracetamol',
      quantity: 10,
      symbol: '*',
      dose: 2,
      days: 3,
      stock: 100,
      visit_id: visit.id
    }
  end

  let(:invalid_attributes) do
    {
      product: '',
      quantity: '',
      symbol: '',
      dose: '',
      days: '',
      stock: ''
    }
  end

  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Prescription.create! valid_attributes
      get prescriptions_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      prescription = Prescription.create! valid_attributes
      get prescription_url(prescription), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Prescription' do
        expect do
          Prescription.create! valid_attributes
          post prescriptions_url,
               params: { prescription: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Prescription, :count).by(2)
      end

      it 'renders a JSON response with the new prescription' do
        Prescription.create! valid_attributes
        post prescriptions_url,
             params: { prescription: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Prescription' do
        expect do
          post prescriptions_url,
               params: { prescription: invalid_attributes }, as: :json
        end.to change(Prescription, :count).by(0)
      end

      it 'renders a JSON response with errors for the new prescription' do
        post prescriptions_url,
             params: { prescription: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          product: 'Paracetamol',
          quantity: 10, symbol: '*',
          dose: 2,
          days: 3,
          stock: 99,
          visit_id: visit.id
        }
      end

      it 'updates the requested prescription' do
        prescription = Prescription.create! valid_attributes
        patch prescription_url(prescription),
              params: { prescription: new_attributes }, headers: valid_headers, as: :json
        prescription.reload
        {
          product: 'Paracetamol', quantity: 10, symbol: '*', dose: 2, days: 3, stock: 99
        }
      end

      it 'renders a JSON response with the prescription' do
        prescription = Prescription.create! valid_attributes
        patch prescription_url(prescription),
              params: { prescription: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the prescription' do
        prescription = Prescription.create! valid_attributes
        patch prescription_url(prescription),
              params: { prescription: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested prescription' do
      prescription = Prescription.create! valid_attributes
      expect do
        delete prescription_url(prescription), headers: valid_headers, as: :json
      end.to change(Prescription, :count).by(-1)
    end
  end
end
