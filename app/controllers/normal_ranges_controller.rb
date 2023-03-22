class NormalRangesController < ApplicationController
  before_action :set_normal_range, only: %i[show update destroy]

  # GET /normal_ranges
  def index
    @normal_ranges = NormalRange.all

    render json: @normal_ranges
  end

  # GET /normal_ranges/1
  def show
    render json: @normal_range
  end

  # POST /normal_ranges
  def create
    @normal_range = NormalRange.new(normal_range_params)

    if @normal_range.save
      render json: @normal_range, status: :created, location: @normal_range
    else
      render json: @normal_range.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /normal_ranges/1
  def update
    if @normal_range.update(normal_range_params)
      render json: @normal_range
    else
      render json: @normal_range.errors, status: :unprocessable_entity
    end
  end

  # DELETE /normal_ranges/1
  def destroy
    @normal_range.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_normal_range
    @normal_range = NormalRange.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def normal_range_params
    params.require(:normal_range).permit(:name, :lower_range, :upper_range, :unit, :lab_test_id)
  end
end
