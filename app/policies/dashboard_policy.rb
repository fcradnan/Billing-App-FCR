class DashboardPolicy < ApplicationPolicy
  def index?
    admin? || buyer?
  end
end
