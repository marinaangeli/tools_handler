class Tool < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
