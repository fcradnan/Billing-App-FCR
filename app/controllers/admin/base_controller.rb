module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin!

    private

    def ensure_admin!
      unless current_user.is_a?(AdminUser)
        redirect_to buyer_dashboard_path, alert: "Access denied!"
      end
    end
  end
end
