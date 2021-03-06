class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    meal = Meal.find_by_id(params[:id])
    if meal
      render json: meal
    else
      render json: {'status' => 404}, status: 404
    end
  end

  def create
    meal = Meal.find_by_id(params[:meal_id])
    food = Food.find_by_id(params[:id])
    if meal && food
      MealFood.create(meal_id: meal.id, food_id: food.id)
      count = food.timesEaten += 1
      food.update(timesEaten: count)
      render json: {"message" => "Successfully added #{food.name} to #{meal.name}"}, status: 201
    else
      render json: {'status' => 404}, status: 404
    end
  end

  def delete
    meal = Meal.find_by_id(params[:meal_id])
    food = Food.find_by_id(params[:id])
    if meal && food
    meal_food = MealFood.where(meal_id: meal.id, food_id: food.id)
      if meal_food.first != nil
        meal_food.destroy_all
        render json: {"message" => "Successfully removed #{food.name} from #{meal.name}"}, status: 201
      else
        render json: {'status' => 404}, status: 404
      end
    else
      render json: {'status' => 404}, status: 404
    end
  end
end
