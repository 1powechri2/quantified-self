require 'rails_helper'

RSpec.describe Meal, type: :model do
  context 'features' do
    it {should validate_presence_of(:name)}
    it {should have_many(:meal_foods)}
    it {should have_many(:foods).through(:meal_foods)}
  end
end
