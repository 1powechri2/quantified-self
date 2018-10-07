require 'rails_helper'

describe 'the meals index page' do
  context '/api/v1/meals' do
    it 'returns a collection of meals and their individual collections of foods' do
      meal1 = create(:meal)
      meal2 = create(:meal)
      food1 = create(:food, name: 'mud pie')
      food2 = create(:food, name: 'blood pie')

      create(:meal_food, meal_id: meal1.id, food_id: food1.id)
      create(:meal_food, meal_id: meal1.id, food_id: food2.id)
      create(:meal_food, meal_id: meal2.id, food_id: food2.id)

      get '/api/v1/meals'

      expect(response).to be_successful

      meals_json = JSON.parse(response.body, symbolize_names: true)

      expect(meals_json[0][:name]).to eq(meal1.name)
      expect(meals_json[0][:foods].count).to eq(2)
      expect(meals_json[1][:name]).to eq(meal2.name)
      expect(meals_json[1][:foods].count).to eq(1)
    end
  end
  context '/api/v1/meals/:id/foods' do
    it 'returns a meals and its individual collections of foods' do
      meal1 = create(:meal)
      meal2 = create(:meal)
      food1 = create(:food, name: 'mud pie')
      food2 = create(:food, name: 'blood pie')

      create(:meal_food, meal_id: meal1.id, food_id: food1.id)
      create(:meal_food, meal_id: meal1.id, food_id: food2.id)
      create(:meal_food, meal_id: meal2.id, food_id: food2.id)

      get "/api/v1/meals/#{meal1.id}/foods"

      expect(response).to be_successful

      meals_json = JSON.parse(response.body, symbolize_names: true)

      expect(meals_json[:name]).to eq(meal1.name)
      expect(meals_json[:foods].count).to eq(2)
    end
  end
  context '/api/v1/meals/:id/foods' do
    it 'returns a 404 json error if meal cannot be found' do
      meal1 = create(:meal)
      meal2 = create(:meal)
      food1 = create(:food, name: 'mud pie')
      food2 = create(:food, name: 'blood pie')

      create(:meal_food, meal_id: meal1.id, food_id: food1.id)
      create(:meal_food, meal_id: meal1.id, food_id: food2.id)
      create(:meal_food, meal_id: meal2.id, food_id: food2.id)

      get "/api/v1/meals/500/foods"

      expect(response).to be_successful

      meals_json = JSON.parse(response.body, symbolize_names: true)

      expect(meals_json[:status]).to eq(404)
    end
  end
end
