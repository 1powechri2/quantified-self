require 'rails_helper'

describe 'delete a food from a meal' do
  context '/api/v1/meals/:meal_id/foods/:id' do
    it 'can delete a food from a meal' do
      food = create(:food)
      meal = create(:meal)

      meal_food = create(:meal_food, meal_id: meal.id, food_id: food.id)

      expect(MealFood.find_by_id(meal_food.id)).to eq(meal_food)

      delete "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      expect(MealFood.find_by_id(meal_food.id)).to eq(nil)

      resp_json = JSON.parse(response.body)
      expect(resp_json).to eq({ "message" => "Successfully removed #{food.name} from #{meal.name}" })
    end
    it 'returns 404 if meal_food doesn\'t exist' do
      food = create(:food)
      meal = create(:meal)

      delete "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      expect(response.status).to eq(404)
    end
    it 'returns 404 if meal or food doesn\'t exist' do
      food = create(:food)
      meal = create(:meal)

      delete "/api/v1/meals/#{meal.id}/foods/#{food.id + 100}"

      expect(response.status).to eq(404)
    end
  end
end
