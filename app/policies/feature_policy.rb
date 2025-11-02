class FeaturePolicy < ApplicationPolicy
  def index?
    admin?|| buyer?
  end

  def create?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end
end
