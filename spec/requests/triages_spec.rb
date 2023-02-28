require 'rails_helper'

RSpec.describe '/triages', type: :request do
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
      name: 'Test Triage',
      value_one: '35',
      value_two: '24',
      date_time: DateTime.now,
      visit_id: visit.id
    }
  end

  let(:invalid_attributes) do
    {
      name: 'Test Triage',
      value_one: '',
      value_two: '',
      date_time: DateTime.now,
      visit_id: nil
    }
  end

  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Triage.create! valid_attributes
      get triages_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      triage = Triage.create! valid_attributes
      get triage_url(triage), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Triage' do
        expect do
          post triages_url,
               params: { triage: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Triage, :count).by(1)
      end

      it 'renders a JSON response with the new triage' do
        post triages_url,
             params: { triage: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Triage' do
        expect do
          post triages_url,
               params: { triage: invalid_attributes }, as: :json
        end.to change(Triage, :count).by(0)
      end

      it 'renders a JSON response with errors for the new triage' do
        post triages_url,
             params: { triage: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'Test Triage', value_one: '32', value_two: '24', date_time: DateTime.now }
      end

      it 'updates the requested triage' do
        triage = Triage.create! valid_attributes
        patch triage_url(triage),
              params: { triage: new_attributes }, headers: valid_headers, as: :json
        triage.reload
        { name: 'Test Triage', value_one: '32', value_two: '24', date_time: DateTime.now }
      end

      it 'renders a JSON response with the triage' do
        triage = Triage.create! valid_attributes
        patch triage_url(triage),
              params: { triage: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the triage' do
        triage = Triage.create! valid_attributes
        patch triage_url(triage),
              params: { triage: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested triage' do
      triage = Triage.create! valid_attributes
      expect do
        delete triage_url(triage), headers: valid_headers, as: :json
      end.to change(Triage, :count).by(-1)
    end
  end
end
