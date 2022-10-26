class Tool < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  AVAILABLE = [true, false]

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :availability, inclusion: { in: AVAILABLE }
end
