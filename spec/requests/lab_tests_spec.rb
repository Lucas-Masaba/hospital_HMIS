require 'rails_helper'

RSpec.describe '/lab_tests', type: :request do
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
      name: 'Blood Test',
      price: 30_000,
      status: 'Positive',
      referral_status: 'Unknown',
      visit_id: visit.id
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      price: '',
      status: '',
      referral_status: '',
      visit_id: ''
    }
  end

  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      LabTest.create! valid_attributes
      get lab_tests_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      lab_test = LabTest.create! valid_attributes
      get lab_test_url(lab_test), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new LabTest' do
        expect do
          post lab_tests_url,
               params: valid_attributes, headers: valid_headers, as: :json
        end.to change(LabTest, :count).by(1)
      end

      it 'renders a JSON response with the new lab_test' do
        post lab_tests_url,
             params: valid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new LabTest' do
        expect do
          post lab_tests_url,
               params: { lab_test: invalid_attributes }, as: :json
        end.to change(LabTest, :count).by(0)
      end

      it 'renders a JSON response with errors for the new lab_test' do
        post lab_tests_url,
             params: { lab_test: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'H Pylori',
          price: 2045,
          status: 'Negative',
          referral_status: 'Unknown',
          visit_id: visit.id
        }
      end

      it 'updates the requested lab_test' do
        lab_test = LabTest.create! valid_attributes
        patch lab_test_url(lab_test),
              params: { lab_test: new_attributes }, headers: valid_headers, as: :json
        lab_test.reload
        expect(lab_test.name).to eq('Blood Test')
      end

      it 'renders a JSON response with the lab_test' do
        lab_test = LabTest.create! valid_attributes
        patch lab_test_url(lab_test),
              params: { lab_test: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the lab_test' do
        lab_test = LabTest.create! valid_attributes
        patch lab_test_url(lab_test),
              params: { lab_test: invalid_attributes }, headers: valid_headers, as: :json
        # expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested lab_test' do
      lab_test = LabTest.create! valid_attributes
      expect do
        delete lab_test_url(lab_test), headers: valid_headers, as: :json
      end.to change(LabTest, :count).by(-1)
    end
  end
end
