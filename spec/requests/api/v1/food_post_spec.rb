require 'rails_helper'

describe 'post to create a new food' do
  context 'POST /api/v1/foods' do
    it 'can create new food' do
      food = create(:food, name: 'twizlers', calories: 1)

      post '/api/v1/foods', params: { 'food': { 'name': "#{food.name}", 'calories': "#{food.calories}"} }

      expect(response).to be_successful

      food_json = JSON.parse(response.body)
    end
  end
end
