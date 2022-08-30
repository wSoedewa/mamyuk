class Restaurant < ApplicationRecord
  has_many :favorites
  validates :name, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :cuisine, presence: true
  # validates :phone_number, presence: true
end
