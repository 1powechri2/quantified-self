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
end
