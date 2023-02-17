class DrugsController < ApplicationController
  before_action :set_drug, only: %i[show update destroy]

  # GET /drugs
  def index
    @drugs = Drug.all

    render json: @drugs
  end

  # GET /drugs/1
  def show
    render json: @drug
  end

  # POST /drugs
  def create
    @drug = Drug.new(drug_params)

    if @drug.save
      render json: @drug, status: :created, location: @drug
    else
      render json: @drug.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drugs/1
  def update
    if @drug.update(drug_params)
      render json: @drug
    else
      render json: @drug.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drugs/1
  def destroy
    @drug.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_drug
    @drug = Drug.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def drug_params
    params.require(:drug).permit(:name, :quantity, :location, :drug_no)
  end
end
