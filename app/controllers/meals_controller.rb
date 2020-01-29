require_relative "../views/meals_view"
require_relative "../models/meal"
class MealsController
  def initialize(meal_repository)
    # MealRepository.new(csv_file_path)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end
  # list meals
  def list
    # 1. get all the meals -> meal_repo
    meals = @meal_repository.all
    # 2. display meals -> meals_view
    @meals_view.display(meals)
  end

  # add meals
  def add
    #1. Ask user for name and price -> meals_view
    name = @meals_view.ask_for("name")
    price = @meals_view.ask_for("price").to_i
    meal_hash = { name: name, price: price }
    #2. Create an instance of meals with those properties
    meal_instance = Meal.new(meal_hash)
    #3. add meal instance to repo
    @meal_repository.add(meal_instance)
  end
end






