class Api::V1::FoodsController < ActionController::API
  def index
    render json: Food.all
  end

  def show
  food = Food.find_by_id(params[:id])
    if food
      render json: food
    else
      render json: {status: 404}
    end
  end

  def create
    food = Food.create(food_params)
    if food.id != nil
      render json: food
    else
      render json: {status: 400}
    end
  end

  def update
    food = Food.find(params[:id])
    if food_params[:name] && food_params[:calories] 
      food.update(food_params)
      render json: food
    else
      render json: {status: 400}
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
