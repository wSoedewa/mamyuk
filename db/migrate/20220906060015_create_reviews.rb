class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :text
      t.string :author_name
      t.float :rating
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
