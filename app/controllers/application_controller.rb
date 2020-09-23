class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  # private

  # def current_user
  #   @_current_user ||= session[:current_user_id] &&
  #     User.find_by(id: session[:current_user_id])
  # end
end
