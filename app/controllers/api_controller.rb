class ApiController < ApplicationController
  before_action :set_default_format
  before_action :authenticate_user!

  protected

  def render_error(error)
    render json: { status: :fail, message: error }, status: :bad_request
  end

  private

  def set_default_format
    request.format = :json
  end
end
