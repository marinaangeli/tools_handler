class AddDatesToRentals < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :start_date, :datetime
    add_column :rentals, :end_date, :datetime
  end
end
