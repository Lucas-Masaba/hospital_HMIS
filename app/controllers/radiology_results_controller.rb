class RadiologyResultsController < ApplicationController
  before_action :set_radiology_result, only: %i[show update destroy]

  # GET /radiology_results
  def index
    @radiology_results = RadiologyResult.all

    render json: @radiology_results
  end

  # GET /radiology_results/1
  def show
    render json: @radiology_result
  end

  # POST /radiology_results
  def create
    @radiology_result = RadiologyResult.new(radiology_result_params)

    if @radiology_result.save
      render json: @radiology_result, status: :created, location: @radiology_result
    else
      render json: @radiology_result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /radiology_results/1
  def update
    if @radiology_result.update(radiology_result_params)
      render json: @radiology_result
    else
      render json: @radiology_result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /radiology_results/1
  def destroy
    @radiology_result.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_radiology_result
    @radiology_result = RadiologyResult.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def radiology_result_params
    params.require(:radiology_result).permit(:image, :notes, :radiology_exam_id)
  end
end
