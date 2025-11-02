module Admin
  class UsagesController < BaseController
    def new
      authorize Usage
      @usage = Usage.new
      @buyers = BuyerUser.all
      @features = Feature.all
    end

    def create
      authorize Usage
      buyer = BuyerUser.find(usage_params[:buyer_id])
      subscription = buyer.active_subscription

      if subscription.nil?
        redirect_to new_admin_usage_path, alert: "This buyer has no active subscription."
        return
      end

      @usage = Usage.new(
        subscription_id: subscription.id,
        feature_id: usage_params[:feature_id],
        units_used: usage_params[:units_used],
        usage_date: Date.today,
      )

      if @usage.save
        redirect_to admin_dashboard_path, notice: "Usage added successfully for #{buyer.name}."
      else
        @buyers = BuyerUser.all
        @features = Feature.all
        render :new
      end
    end

    private

    def usage_params
      params.require(:usage).permit(:buyer_id, :feature_id, :units_used)
    end
  end
end
