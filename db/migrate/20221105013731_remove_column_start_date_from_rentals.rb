class RemoveColumnStartDateFromRentals < ActiveRecord::Migration[7.0]
  def change
    remove_column :rentals, :start_date, :datetime
  end
end
