class Food < ApplicationRecord
  validates :name, uniqueness: true
  validates_presence_of :calories

  has_many :meal_foods
  has_many :meals, through: :meal_foods
end
