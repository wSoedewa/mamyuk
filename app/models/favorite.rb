class Favorite < ApplicationRecord
  belongs_to :restaurant
  belongs_to :list
end
