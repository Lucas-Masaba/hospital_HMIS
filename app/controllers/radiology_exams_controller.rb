class RadiologyExamsController < ApplicationController
  before_action :set_radiology_exam, only: %i[show update destroy]

  # GET /radiology_exams
  def index
    @radiology_exams = RadiologyExam.all

    render json: @radiology_exams
  end

  # GET /radiology_exams/1
  def show
    render json: @radiology_exam
  end

  # POST /radiology_exams
  def create
    @radiology_exam = RadiologyExam.new(radiology_exam_params)

    if @radiology_exam.save
      render json: @radiology_exam, status: :created, location: @radiology_exam
    else
      render json: @radiology_exam.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /radiology_exams/1
  def update
    if @radiology_exam.update(radiology_exam_params)
      render json: @radiology_exam
    else
      render json: @radiology_exam.errors, status: :unprocessable_entity
    end
  end

  # DELETE /radiology_exams/1
  def destroy
    @radiology_exam.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_radiology_exam
    @radiology_exam = RadiologyExam.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def radiology_exam_params
    params.require(:radiology_exam).permit(:name, :description, :visit_id)
  end
end
