class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    meal = Meal.find_by_id(params[:id])
    if meal
      render json: meal
    else
      render json: {'status' => 404}
    end
  end
end
