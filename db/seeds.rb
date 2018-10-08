food1 = Food.create(name: 'Twinky', calories: 150, timesEaten: 4)
food2 = Food.create(name: 'Beer', calories: 154, timesEaten: 3)
food3 = Food.create(name: 'Oyster', calories: 175, timesEaten: 5)

meal1 = Meal.create(name: 'Breakfast')
meal2 = Meal.create(name: 'Lunch')
meal3 = Meal.create(name: 'Dinner')
meal4 = Meal.create(name: 'Snack')

MealFood.create(meal_id: meal1.id, food_id: food1.id)
MealFood.create(meal_id: meal1.id, food_id: food2.id)
MealFood.create(meal_id: meal1.id, food_id: food3.id)

MealFood.create(meal_id: meal2.id, food_id: food1.id)
MealFood.create(meal_id: meal2.id, food_id: food1.id)
MealFood.create(meal_id: meal2.id, food_id: food3.id)

MealFood.create(meal_id: meal3.id, food_id: food1.id)
MealFood.create(meal_id: meal3.id, food_id: food3.id)
MealFood.create(meal_id: meal3.id, food_id: food3.id)

MealFood.create(meal_id: meal4.id, food_id: food2.id)
MealFood.create(meal_id: meal4.id, food_id: food2.id)
MealFood.create(meal_id: meal4.id, food_id: food3.id)
