class TriagesController < ApplicationController
  before_action :set_triage, only: %i[ show update destroy ]

  # GET /triages
  def index
    @triages = Triage.all

    render json: @triages
  end

  # GET /triages/1
  def show
    render json: @triage
  end

  # POST /triages
  def create
    @triage = Triage.new(triage_params)

    if @triage.save
      render json: @triage, status: :created, location: @triage
    else
      render json: @triage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /triages/1
  def update
    if @triage.update(triage_params)
      render json: @triage
    else
      render json: @triage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /triages/1
  def destroy
    @triage.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_triage
      @triage = Triage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def triage_params
      params.require(:triage).permit(:name, :value_one, :value_two, :date_time)
    end
end
