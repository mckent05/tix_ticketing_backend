# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :first_name, :last_name, :role)
    end
  end
end
