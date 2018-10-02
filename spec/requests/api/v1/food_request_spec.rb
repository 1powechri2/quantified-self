require 'rails_helper'

describe 'foods api endpoint' do
  context '/api/v1/foods' do
    it 'returns JSON collection of foods' do
      list = create_list(:food, 3)

      get '/api/v1/foods'

      expect(response).to be_successful

      foods = JSON.parse(response.body)

      expect(foods.count).to eq(3)
      expect(foods.first).to have_value(list.first.id)
      expect(foods.first).to have_value(list.first.name)
      expect(foods.first).to have_value(list.first.calories)
      expect(foods.first).to_not have_value(list.first.created_at)
      expect(foods.first).to_not have_value(list.first.updated_at)
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
