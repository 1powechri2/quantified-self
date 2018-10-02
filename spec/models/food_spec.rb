require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'can create a food item' do
    food = create(:food, name: 'lksjs', calories: 765)

    test_food = Food.find(food.id)

    expect(test_food.name).to eq(food.name)
    expect(test_food.calories).to eq(food.calories)
  end
end
