class SubscriptionPolicy < ApplicationPolicy
  def new?
    buyer?
  end

  def create?
    buyer?
  end

  def cancel?
    buyer?
  end
end
