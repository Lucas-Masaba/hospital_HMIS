class LabResultsController < ApplicationController
  before_action :set_lab_result, only: %i[show update destroy]

  # GET /lab_results
  def index
    @lab_results = LabResult.all

    render json: @lab_results
  end

  # GET /lab_results/1
  def show
    render json: @lab_result
  end

  # POST /lab_results
  def create
    @lab_result = LabResult.new(lab_result_params)

    if @lab_result.save
      render json: @lab_result, status: :created, location: @lab_result
    else
      render json: @lab_result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lab_results/1
  def update
    if @lab_result.update(lab_result_params)
      render json: @lab_result
    else
      render json: @lab_result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lab_results/1
  def destroy
    @lab_result.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lab_result
    @lab_result = LabResult.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lab_result_params
    params.require(:lab_result).permit(:lab_result)
  end
end
