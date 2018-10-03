require 'rails_helper'

describe 'it can update foods' do
  context 'patch api/v1/foods/:id' do
    it 'updates a food' do
      food = create(:food, name: 'mint', calories: 666)

      patch "/api/v1/foods/#{food.id}", params: { "food": { "name": "Mint", "calories": "14"} }

      food = Food.find(food.id)

      expect(food.calories).to eq(14)
    end
    it 'does not update a food with invalid attributes' do
      food = create(:food, name: 'mint', calories: 666)

      patch "/api/v1/foods/#{food.id}", params: { "food": { "street_name": "Mint", "calories_from_fat": "14"} }

      food = Food.find(food.id)

      endpoint = JSON.parse(response.body, symbolize_names: true)

      expect(endpoint[:status]).to eq(400)
      expect(food.calories).to eq(666)
    end
  end
end
