class Tool < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  validates :name, :price, :availability, presence: true
end
