class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if:  :devise_controller?

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
    end

    def authorize_admin
      redirect_to root_path, alert: "Permissions denied" unless
        current_user && current_user.admin
    end
end
