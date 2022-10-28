class RemoveAvailabilityFromTools < ActiveRecord::Migration[7.0]
  def change
    remove_column :tools, :availability, :boolean
  end
end
