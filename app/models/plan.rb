class Plan < ApplicationRecord
  has_many :subscriptions, dependent:  :destroy
  has_many :plan_features, dependent:  :destroy
  has_many :features, through:  :plan_features
  has_many :buyers, through:  :subscriptions

  validates :name, presence: true, uniqueness: true
  validates :monthly_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
