class BillingPolicy < ApplicationPolicy
  def run?
    admin?
  end
end
