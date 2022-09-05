class ChangeRatingDone < ActiveRecord::Migration[7.0]
  def change
    change_column :restaurants, :rating, :float
    change_column :restaurants, :price, :integer
  end
end
