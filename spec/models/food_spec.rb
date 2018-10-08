require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'can create a food item' do
    food = create(:food, name: 'lksjs', calories: 765)

    test_food = Food.find(food.id)

    expect(test_food.name).to eq(food.name)
    expect(test_food.calories).to eq(food.calories)
  end
  context 'validations' do
    it {should validate_uniqueness_of(:name)}
    it {should validate_presence_of(:calories)}
    it {should have_many(:meal_foods)}
    it {should have_many(:meals).through(:meal_foods)}
  end
  context 'class methods' do
    it 'can return 3 favorite foods' do
      food1 = create(:food, name: 'mud pie', timesEaten: 3)
      food2 = create(:food, name: 'blood pie', timesEaten: 4)
      food3 = create(:food, name: 'crud pie', timesEaten: 7)
      food4 = create(:food, name: 'pug pie', timesEaten: 2)

      expect(Food.favorites).to eq([food3, food2, food1])
    end
  end
end
