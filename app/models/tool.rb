class Tool < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  validates :name, :price, presence: true
  validates :price, numericality: true
end
