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
      
      expect(foods.count).to eq(3)
      expect(foods.first).to have_value(food1.id)
      expect(foods.first).to have_value(food1.name)
      expect(foods.first).to have_value(food1.calories)
    end
  end
  context '/api/v1/foods/:id' do
    it 'resturns a JSON of an individual food by id' do
      food = create(:food)

      get "/api/v1/foods/#{food.id}"

      expect(response).to be_successful

      food_json = JSON.parse(response.body, symbolize_names: true)

      expect(food_json[:id]).to eq(food.id)
      expect(food_json[:name]).to eq(food.name)
      expect(food_json[:calories]).to eq(food.calories)
    end
  end
  context '/api/v1/foods/:id' do
    it 'resturns a 404 with invalid id' do
      food = create(:food)

      get "/api/v1/foods/#{food.id + 2}"

      expect(response.status).to eq(404)
    end
  end
end
