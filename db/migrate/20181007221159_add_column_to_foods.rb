class AddColumnToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :timesEaten, :integer, default: 0
  end
end
