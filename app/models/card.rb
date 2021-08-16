class Card < ApplicationRecord
  belongs_to :user

  validates :number, presence: true
  validates :brand, presence: true
end
