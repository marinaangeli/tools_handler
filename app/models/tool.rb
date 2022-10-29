class Tool < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  RATINGS = [1, 2, 3, 4, 5]
  validates :rating, inclusion: { in: RATINGS }
end
