class TransactionPolicy < ApplicationPolicy
  def index?
    buyer?
  end
end
