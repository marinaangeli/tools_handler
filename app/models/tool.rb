class Tool < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
