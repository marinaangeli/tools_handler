class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  before_save :calculate_cost

  private

  def calculate_cost
    self.cost = tool.price * days
  end
end
