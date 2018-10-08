require 'rails_helper'

describe 'posting food to meal' do
  context '/api/v1/meals/:meal_id/foods/:id' do
    it 'creates a new meal-food relationship' do
      food = create(:food)
      meal = create(:meal)

      post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      expect(response.status).to eq(201)

      resp_json = JSON.parse(response.body)

      expect(resp_json).to eq({ "message" => "Successfully added #{food.name} to #{meal.name}" })
      expect(meal.foods.first).to eq(food)
      expect(Food.find(food.id).timesEaten).to eq(1)
    end
    it 'returns a 404 if post is unsuccesful' do
      food = create(:food)
      meal = create(:meal)

      post "/api/v1/meals/#{meal.id}/foods/#{food.id + 500}"

      expect(response.status).to eq(404)
    end
  end
end
