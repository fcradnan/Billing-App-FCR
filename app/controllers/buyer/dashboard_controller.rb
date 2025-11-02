module Buyer
  class DashboardController < BaseController
    def index
      authorize :dashboard, :index?
      @buyer = current_user
      @subscriptions = @buyer.subscriptions.includes(:plan)
      @transactions = @buyer.transactions.order(created_at: :desc)
    end
  end
end
