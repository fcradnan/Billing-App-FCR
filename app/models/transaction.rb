class Transaction < ApplicationRecord
  belongs_to :buyer, class_name: "BuyerUser", foreign_key: :user_id
  belongs_to :subscription
  enum :transaction_type, { monthly_fee: "monthly_fee", over_usage: "over_usage" }

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_type, presence: true
  validates :transaction_date, presence: true
end
