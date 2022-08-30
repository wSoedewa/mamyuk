class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :location
      t.integer :price
      t.string :name
      t.integer :rating
      t.string :cuisine
      t.string :phone_number

      t.timestamps
    end
  end
end
