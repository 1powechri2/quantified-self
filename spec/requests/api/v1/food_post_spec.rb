require 'rails_helper'

describe 'post to create a new food' do
  context 'POST /api/v1/foods' do
    it 'can create new food' do
      post '/api/v1/foods', params: { 'food': { 'name': 'twizzlers', 'calories': 2} }

      expect(response).to be_successful

      food_json = JSON.parse(response.body, symbolize_names: true)

      expect(food_json[:name]).to eq('twizzlers')
      expect(food_json[:calories]).to eq(2)
    end
    it 'renders 400 if error' do
      post '/api/v1/foods', params: { 'food': { 'name': 'twizzlers' } }

      expect(response.status).to eq(400)
    end
  end
end
