class AddAddressToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :address, :string
  end
end
