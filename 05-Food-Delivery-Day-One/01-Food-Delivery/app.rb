# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative '../01-Food-Delivery/app/repositories/meal_repository'
require_relative '../01-Food-Delivery/app/controllers/meals_controller'
require_relative '../01-Food-Delivery/app/repositories/customer_repository'
require_relative '../01-Food-Delivery/app/controllers/customers_controller'
require_relative 'router'

csv_file   = File.join(__dir__, 'meals.csv')
meal_repository   = MealRepository.new(csv_file)
meals_controller = MealsController.new(meal_repository)
customer_repository   = CustomerRepository.new(csv_file)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)

router.run
