class List < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :restaurants, through: :favorites
  validates :name, presence: true
  validates :name, uniqueness: { message: "List already exists." }
end
