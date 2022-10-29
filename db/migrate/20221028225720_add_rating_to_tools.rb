class AddRatingToTools < ActiveRecord::Migration[7.0]
  def change
    add_column :tools, :rating, :integer
  end
end
