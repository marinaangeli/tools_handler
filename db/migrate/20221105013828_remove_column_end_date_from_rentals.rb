class RemoveColumnEndDateFromRentals < ActiveRecord::Migration[7.0]
  def change
    remove_column :rentals, :end_date, :datetime
  end
end
