module Admin
  class ProfilesController < BaseController
    include ProfileActions
    before_action :authenticate_user!

    private

    def after_profile_update_path
      admin_dashboard_path
    end
  end
end
