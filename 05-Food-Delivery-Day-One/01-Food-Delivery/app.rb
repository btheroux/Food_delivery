# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative '../01-Food-Delivery/app/repositories/meal_repository'
require_relative '../01-Food-Delivery/app/controllers/meals_controller'
require_relative '../01-Food-Delivery/app/repositories/customer_repository'
require_relative '../01-Food-Delivery/app/controllers/customers_controller'
require_relative '../01-Food-Delivery/app/repositories/employee_repository'
require_relative '../01-Food-Delivery/app/controllers/sessions_controller'
require_relative 'router'

meals_csv   = File.join(__dir__, 'data/meals.csv')
meal_repository   = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meal_repository)
customers_csv   = File.join(__dir__, 'data/customers.csv')
customer_repository   = CustomerRepository.new(customers_csv)
customers_controller = CustomersController.new(customer_repository)
employees_csv   = File.join(__dir__, 'data/employees.csv')
employee_repository   = EmployeeRepository.new(employees_csv)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run
