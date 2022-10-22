class Tool < ApplicationRecord
  belongs_to :user

  validates :name, :price, :availability, presence: true
end
