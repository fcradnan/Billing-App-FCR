class Feature < ApplicationRecord
  has_many :usages, dependent: :destroy
  has_many :plan_features, dependent: :destroy
  has_many :plans, through: :plan_features

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :unit_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :max_unit_limit, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
