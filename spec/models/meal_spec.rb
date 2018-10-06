require 'rails_helper'

RSpec.describe Meal, type: :model do
  context 'features' do
    it {should validate_presence_of(:name)}
  end
end
