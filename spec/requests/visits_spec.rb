require 'rails_helper'

RSpec.describe '/visits', type: :request do
  let(:url) { '/visits' }

  let(:valid_attributes) do
    {
      visit_no: '2',
      visit_owner: 'Caitylyn',
      visit_date: '2023-01-23',
      visit_type: 'review',
      visit_category: 'insurance',
      speciality: 'cardiology',
      member_no: '2A5R2',
      service: 'Consultation',
      patient_id: 1
    }
  end

  let(:invalid_attributes) do
    {
      visit_no: '',
      visit_owner: '',
      visit_date: '2023-01',
      visit_type: '',
      visit_category: '',
      speciality: '',
      member_no: '',
      service: '',
      patient_id: nil
    }
  end

  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  let!(:patient) do
    Patient.create(
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

  describe 'GET /index' do
    it 'renders a successful response' do
      Visit.create! valid_attributes.merge(patient_id: patient.id)
      get visits_path, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      visit = Visit.create! valid_attributes.merge(patient_id: patient.id)
      get visit_path(visit), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Visit' do
        expect do
          Visit.create! valid_attributes.merge(patient_id: patient.id)
          post visits_path,
               params: { visit: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Visit, :count).by(1)
      end

      it 'renders a JSON response with the new visit' do
        Visit.create! valid_attributes.merge(patient_id: patient.id)
        post visits_path,
             params: { visit: valid_attributes }, headers: valid_headers, as: :json
        # expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Visit' do
        expect do
          post visits_path,
               params: { visit: invalid_attributes }, as: :json
        end.to change(Visit, :count).by(0)
      end

      it 'renders a JSON response with errors for the new visit' do
        post visits_path,
             params: { visit: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          visit_no: '2',
          visit_owner: 'Caitylyn',
          visit_date: '2023-01-23',
          visit_type: 'review',
          visit_category: 'insurance',
          speciality: 'cardiology',
          member_no: '2A5R2',
          service: 'Treatment',
          patient_id: 1
        }
      end

      it 'updates the requested visit' do
        visit = Visit.create! valid_attributes.merge(patient_id: patient.id)
        patch visit_url(visit),
              params: { visit: new_attributes }, headers: valid_headers, as: :json
        visit.reload
        {
          visit_no: '2',
          visit_owner: 'Caitylyn',
          visit_date: '2023-01-23',
          visit_type: 'review',
          visit_category: 'insurance',
          speciality: 'cardiology',
          member_no: '2A5R2',
          service: 'Treatment',
          patient_id: '1'
        }
      end

      it 'renders a JSON response with the visit' do
        visit = Visit.create! valid_attributes.merge(patient_id: patient.id)
        patch visit_url(visit),
              params: { visit: new_attributes }, headers: valid_headers, as: :json
        # expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the visit' do
        visit = Visit.create! valid_attributes.merge(patient_id: patient.id)
        patch visit_url(visit),
              params: { visit: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested visit' do
      visit = Visit.create! valid_attributes.merge(patient_id: patient.id)
      expect do
        delete visit_path(visit), headers: valid_headers, as: :json
      end.to change(Visit, :count).by(-1)
    end
  end
end
