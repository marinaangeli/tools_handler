class RemoveStateFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :state
  end
end
