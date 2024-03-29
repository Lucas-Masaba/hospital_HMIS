require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/patients', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Patient. As you add validations to Patient, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    # skip("Add a hash of attributes valid for your model")
    { name: 'Kemigisa Diana', age: 12, gender: 'F', date_of_birth: '2023-01-23',
      address: 'Kampala', phone_number: 256_777_777_777, next_of_kin: 'Mwine Tom',
      next_of_kin_phone: 256_770_773_778, next_of_kin_address: 'Kampala' }
  end

  let(:invalid_attributes) do
    { name: 'Kemigisa Diana', age: 12, gender: 'F', date_of_birth: '2023-01-23',
      address: 'Kampala', phone_number: 256_777_777_777, next_of_kin: 'Mwine Tom',
      next_of_kin_phone: 256_770_773_778, next_of_kin_address: '' }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PatientsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    { 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Patient.create! valid_attributes
      get patients_path, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      patient = Patient.create! valid_attributes
      get patient_path(patient), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Patient' do
        expect do
          post patients_path,
               params: { patient: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Patient, :count).by(1)
      end

      it 'renders a JSON response with the new patient' do
        post patients_path,
             params: { patient: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Patient' do
        expect do
          post patients_path,
               params: { patient: invalid_attributes }, as: :json
        end.to change(Patient, :count).by(0)
      end

      it 'renders a JSON response with errors for the new patient' do
        post patients_path,
             params: { patient: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'Kemigisa Diana', age: 15, gender: 'F', date_of_birth: '2023-01-23',
          address: 'Kampala', phone_number: 256_777_777_777, next_of_kin: 'Mwine Tom',
          next_of_kin_phone: 256_770_773_778, next_of_kin_address: 'Kampala' }
      end

      it 'updates the requested patient' do
        patient = Patient.create! valid_attributes
        patch patient_path(patient),
              params: { patient: new_attributes }, headers: valid_headers, as: :json
        patient.reload
        { name: 'Kemigisa Diana', age: 15, gender: 'F', date_of_birth: '2023-01-23',
          address: 'Kampala', phone_number: 256_777_777_777, next_of_kin: 'Mwine Tom',
          next_of_kin_phone: 256_770_773_778, next_of_kin_address: 'Kampala' }
      end

      it 'renders a JSON response with the patient' do
        patient = Patient.create! valid_attributes
        patch patient_path(patient),
              params: { patient: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the patient' do
        patient = Patient.create! valid_attributes
        patch patient_path(patient),
              params: { patient: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested patient' do
      patient = Patient.create! valid_attributes
      expect do
        delete patient_path(patient), headers: valid_headers, as: :json
      end.to change(Patient, :count).by(-1)
    end
  end
end
