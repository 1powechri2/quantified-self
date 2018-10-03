class Api::V1::FoodsController < ActionController::API
  def index
    render json: Food.all
  end

  def show
  food = Food.find_by_id(params[:id])
    if food
      render json: food
    else
      render status: 404
    end
  end

  def create
    food = Food.create(food_params)
    if food.id != nil
      render json: food
    else
      render status: 400
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
