class LabTestsController < ApplicationController
  before_action :set_lab_test, only: %i[show update destroy]

  # GET /lab_tests
  def index
    @lab_tests = LabTest.all

    render json: @lab_tests
  end

  # GET /lab_tests/1
  def show
    render json: @lab_test
  end

  # POST /lab_tests
  def create
    @lab_test = LabTest.new(lab_test_params)

    if @lab_test.save
      render json: @lab_test, status: :created, location: @lab_test
    else
      render json: @lab_test.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lab_tests/1
  def update
    if @lab_test.update(lab_test_params)
      render json: @lab_test
    else
      render json: @lab_test.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lab_tests/1
  def destroy
    @lab_test.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lab_test
    @lab_test = LabTest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lab_test_params
    params.permit(:name, :price, :status, :referral_status)
  end
end
