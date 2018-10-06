require 'rails_helper'

describe 'a food can be deleted' do
  context 'delete /api/v1/foods/:id' do
    it 'will delete a food with valid id' do
      food = create(:food)

      delete "/api/v1/foods/#{food.id}"

      resp = JSON.parse(response.body, symbolize_names: true)

      expect(resp[:status]).to eq(204)
    end
    it 'will not delete a food with an invalid id' do
      food = create(:food)

      delete "/api/v1/foods/#{food.id + 500}"

      resp = JSON.parse(response.body, symbolize_names: true)

      expect(resp[:status]).to eq(404)
    end
  end
end
