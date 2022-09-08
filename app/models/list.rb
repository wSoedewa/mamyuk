class List < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :restaurants, through: :favorites
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id, message: "List already exists." }
end
