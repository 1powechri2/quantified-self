require 'rails_helper'

describe 'foods api endpoint' do
  context '/api/v1/foods' do
    it 'returns JSON collection of foods' do
      food1 = create(:food, name: 'gh', calories: 1)
      food2 = create(:food, name: 'ah', calories: 2)
      food3 = create(:food, name: 'gg', calories: 2)

      get '/api/v1/foods'

      expect(response).to be_successful

      foods = JSON.parse(response.body)

      expect(foods.first).to have_value(food1.id)
      expect(foods.first).to have_value(food1.name)
      expect(foods.first).to have_value(food1.calories)
    end
  end
end
