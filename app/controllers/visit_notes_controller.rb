class VisitNotesController < ApplicationController
  before_action :set_visit_note, only: %i[show update destroy]

  # GET /visit_notes
  def index
    @visit_notes = VisitNote.all

    render json: @visit_notes
  end

  # GET /visit_notes/1
  def show
    render json: @visit_note
  end

  # POST /visit_notes
  def create
    @visit_note = VisitNote.new(visit_note_params)

    if @visit_note.save
      render json: @visit_note, status: :created, location: @visit_note
    else
      render json: @visit_note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /visit_notes/1
  def update
    if @visit_note.update(visit_note_params)
      render json: @visit_note
    else
      render json: @visit_note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visit_notes/1
  def destroy
    @visit_note.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_visit_note
    @visit_note = VisitNote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def visit_note_params
    params.require(:visit_note).permit(:complaints, :provisional_diagnosis, :visit_id, :triage_id)
  end
end
