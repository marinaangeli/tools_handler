class AddAvailabletoTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :available, :boolean, default: true, null: false
  end
end
