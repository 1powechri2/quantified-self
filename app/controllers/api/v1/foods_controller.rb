class Api::V1::FoodsController < ActionController::Base
  def index
    render json: Food.all
  end
  
  def show
  food = Food.find_by_id(params[:id])
    if food
      render json: food
    else
      render file: 'public/404.html', status: 404
    end
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
