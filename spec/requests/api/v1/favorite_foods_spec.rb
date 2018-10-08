require 'rails_helper'

describe 'it can return a collection of favorite foods' do
  context 'GET /api/v1/favorite_foods' do
    it 'returns a collection of favorite foods' do
      meal1 = create(:meal, name: 'breakfast')
      meal2 = create(:meal, name: 'lunch')
      meal3 = create(:meal, name: 'dinner')
      meal4 = create(:meal, name: 'snack')
      food1 = create(:food, name: 'mud pie')
      food2 = create(:food, name: 'blood pie')
      food3 = create(:food, name: 'crud pie')
      food4 = create(:food, name: 'pug pie')

      post "/api/v1/meals/#{meal1.id}/foods/#{food1.id}"
      post "/api/v1/meals/#{meal1.id}/foods/#{food2.id}"
      post "/api/v1/meals/#{meal1.id}/foods/#{food3.id}"

      post "/api/v1/meals/#{meal2.id}/foods/#{food1.id}"
      post "/api/v1/meals/#{meal2.id}/foods/#{food4.id}"

      post "/api/v1/meals/#{meal3.id}/foods/#{food1.id}"
      post "/api/v1/meals/#{meal3.id}/foods/#{food3.id}"
      post "/api/v1/meals/#{meal3.id}/foods/#{food2.id}"
      post "/api/v1/meals/#{meal3.id}/foods/#{food2.id}"

      post "/api/v1/meals/#{meal4.id}/foods/#{food4.id}"

      get '/api/v1/favorite_foods'

      expect(response).to be_successful

      resp_json = JSON.parse(response.body, symbolize_names: true)

      expect(resp_json.first[:timesEaten]).to eq(3)
      expect(resp_json.first[:foods].count).to eq(2)
    end
  end
end
