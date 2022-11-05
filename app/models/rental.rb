class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  before_save :calculate_cost

  def num_days
    self.days = (end_date.to_i - start_date.to_i) / 86_400
  end

  private

  def calculate_cost
    self.cost = tool.price * (end_date.to_i - start_date.to_i) / 86_400
  end
end
