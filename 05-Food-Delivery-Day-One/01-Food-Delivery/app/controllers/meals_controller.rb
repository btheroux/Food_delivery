require_relative '../views/view'
require_relative '../models/meal'


class MealsController
  def initialize(meals)
    @meals = meals
    @view = View.new
  end

  def list
    display_meals
  end

  def add
    display_meals
    name = @view.ask_for("is the name")
    price = @view.ask_for("is the price").to_i
    attributes = {name: name, price: price}
    meal = Meal.new(attributes)
    @meals.add(meal)
  end

  private
  def display_meals
    @view.display_meals(@meals.all)
  end
end
