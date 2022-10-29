class RemoveAreaFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :area
  end
end
