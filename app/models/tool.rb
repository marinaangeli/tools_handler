class Tool < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :price, :address, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
