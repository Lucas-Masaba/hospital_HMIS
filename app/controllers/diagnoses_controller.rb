class DiagnosesController < ApplicationController
  before_action :set_diagnosis, only: %i[show update destroy]

  # GET /diagnoses
  def index
    @diagnoses = Diagnosis.all

    render json: @diagnoses
  end

  # GET /diagnoses/1
  def show
    render json: @diagnosis
  end

  # POST /diagnoses
  def create
    @diagnosis = Diagnosis.new(diagnosis_params)

    if @diagnosis.save
      render json: @diagnosis, status: :created, location: @diagnosis
    else
      render json: @diagnosis.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diagnoses/1
  def update
    if @diagnosis.update(diagnosis_params)
      render json: @diagnosis
    else
      render json: @diagnosis.errors, status: :unprocessable_entity
    end
  end

  # DELETE /diagnoses/1
  def destroy
    @diagnosis.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_diagnosis
    @diagnosis = Diagnosis.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def diagnosis_params
    params.require(:diagnosis).permit(:name)
  end
end
