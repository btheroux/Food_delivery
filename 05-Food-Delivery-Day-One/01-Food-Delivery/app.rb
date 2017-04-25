# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative '../01-Food-Delivery/app/repositories/meal_repository'
require_relative '../01-Food-Delivery/app/controllers/meals_controller'
require_relative 'router'

csv_file   = File.join(__dir__, 'meals.csv')
meal_repository   = MealRepository.new(csv_file)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller)

router.run
