class Restaurant < ApplicationRecord
  has_many :favorites
  validates :name, presence: true
  validates :location, presence: true
  validates :cuisine, presence: true
  validates :name, uniqueness: { scope: :location }
  # validates :phone_number, presence: true
end
