class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  before_save :calculate_cost

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def num_days
    self.days = (end_date.to_i - start_date.to_i) / 86_400
  end

  def calculate_cost
    self.cost = tool.price * (end_date.to_i - start_date.to_i) / 86_400
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
