class Admin::BillingController < Admin::BaseController
  def run
    authorize :billing, :run?
    current_user.run_billing_cycle
    redirect_to admin_dashboard_path, notice: "Billing cycle executed successfully!"
  end
end
