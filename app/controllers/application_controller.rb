class ApplicationController < ActionController::Base

  private

    def authorize_admin
      redirect_to root_path, alert: "Permissions denied" unless
        current_user && current_user.admin
    end
end
