require 'rails_helper'

RSpec.describe MealFood, type: :model do
  context 'validations' do
    it {should belong_to(:food)}
    it {should belong_to(:meal)}
  end
  context 'creating food-meal relations' do
    it 'can create a many to many relationship' do
      meal1 = create(:meal)
      meal2 = create(:meal)
      food1 = create(:food, name: 'mud pie')
      food2 = create(:food, name: 'blood pie')

      create(:meal_food, meal_id: meal1.id, food_id: food1.id)
      create(:meal_food, meal_id: meal1.id, food_id: food2.id)
      create(:meal_food, meal_id: meal2.id, food_id: food2.id)

      expect(meal1.foods.count).to eq(2)
      expect(meal2.foods.count).to eq(1)
      expect(food1.meals.count).to eq(1)
      expect(food2.meals.count).to eq(2)
    end
  end
end
