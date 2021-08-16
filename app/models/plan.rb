class Plan < ApplicationRecord
  has_many :subscriptions

  validates :plan_id, presence: true
  validates :name, presence: true
  validates :price, presence: true

end
