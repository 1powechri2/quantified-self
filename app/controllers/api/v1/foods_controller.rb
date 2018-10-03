class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def create
    food = Food.create(food_params)
    binding.pry
    render json: food
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
