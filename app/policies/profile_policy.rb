class ProfilePolicy < ApplicationPolicy
  def show?
    admin? || buyer?
  end

  def edit?
    admin? || buyer?
  end

  def update?
    admin? || buyer?
  end
end
