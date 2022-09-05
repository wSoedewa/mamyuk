class ChangePriceData < ActiveRecord::Migration[7.0]
  def change
    change_column :restaurants, :price, :float
  end
end
