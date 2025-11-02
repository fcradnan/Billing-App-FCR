class UsagePolicy < ApplicationPolicy
  def new?
    admin?
  end

  def create?
    admin?
  end

  def index?
    buyer?
  end
end
