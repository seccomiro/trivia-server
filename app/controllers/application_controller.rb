class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  respond_to :json
  skip_before_action :verify_authenticity_token
end
