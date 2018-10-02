require 'rails_helper'

describe 'foods api endpoint' do
  context '/api/v1/foods' do
    it 'returns JSON collection of foods' do
      list = create_list(:food, 3)

      get '/api/v1/foods'

      expect(response).to be_successful

      foods = JSON.parse(response.body)

      expect(foods.first).to have_value(list.first.id)
      expect(foods.first).to have_value(list.first.name)
      expect(foods.first).to have_value(list.first.calories)
    end
  end
end
