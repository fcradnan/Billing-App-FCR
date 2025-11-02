class Subscription < ApplicationRecord
  belongs_to :buyer, class_name: "BuyerUser", foreign_key: "user_id"
  belongs_to :plan
  has_many :transactions, dependent: :destroy
  has_many :usages, dependent: :destroy

  enum :status, { active: "active", canceled: "canceled", expired: "expired" }

  before_create :set_end_date


  def cancel_subscription
    update!(status: :canceled)
  end
  private

  def set_end_date
    self.end_date = start_date + 30.days
  end
end



