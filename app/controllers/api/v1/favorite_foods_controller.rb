class Api::V1::FavoriteFoodsController < ApplicationController
  def index
    render json: Food.favorites_json
  end
end
