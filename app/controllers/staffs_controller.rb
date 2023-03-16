class StaffsController < ApplicationController
  before_action :authenticate_staff!

  def index
    render json: current_staff, status: :ok
  end
end
