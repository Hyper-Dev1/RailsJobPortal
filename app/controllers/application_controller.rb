class ApplicationController < ActionController::Base
  # Disable CSRF protection for API requests
  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  # Ensure CORS headers are sent for API calls
  before_action :set_cors_headers, if: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def set_cors_headers
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost:5173'
    response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, PATCH'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  # Add any custom fields you want to permit for Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])  # Example
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])  # Example for update
  end
end
