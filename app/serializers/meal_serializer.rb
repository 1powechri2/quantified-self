class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :foods

  has_many :foods

  def foods
    object.foods
  end
end
