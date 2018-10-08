class Food < ApplicationRecord
  validates :name, uniqueness: true
  validates_presence_of :calories

  has_many :meal_foods
  has_many :meals, through: :meal_foods

  def self.favorites
    order(timesEaten: :desc).limit(3)
  end

  def self.favorites_values
    favorites.map do |food|
      food.timesEaten if food.timesEaten > 1
    end.uniq
  end

  def self.favorites_json
    favorites_values.map do |value|
      {"timesEaten" => value,
       "foods" => Food.where(timesEaten: value).map do |food|
       {"name" => food.name,
         "calories" => food.calories,
         "mealsWhenEaten" => food.meals.map do |meal|
           meal.name
         end.uniq}
       end}
     end
  end
end
