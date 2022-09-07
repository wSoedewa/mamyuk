class AddReviewsToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :user_ratings_total, :integer
  end
end
