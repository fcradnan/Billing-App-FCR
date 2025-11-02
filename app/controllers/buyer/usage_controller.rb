module Buyer
  class UsageController < BaseController
    def index
      authorize Usage
      @buyer = current_user
      @usages = Usage.joins(:subscription)
                     .where(subscriptions: { user_id: @buyer.id }) # 👈 fixed here
                     .includes(:feature, :subscription)
                     .order(usage_date: :desc)
    end
  end
end
