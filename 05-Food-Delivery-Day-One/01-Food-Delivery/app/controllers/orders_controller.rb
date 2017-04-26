require 'pry-byebug'
require_relative '../views/view'
require_relative '../models/order'

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @orders = order_repository
    @meals = meal_repository
    @employees = employee_repository
    @customers = customer_repository
    @view = View.new
  end

  def list_undelivered_orders
    undelivered_orders = @orders.undelivered_orders
    @view.display_orders(undelivered_orders)
  end

  def list_my_orders(employee)
    # binding.pry
    my_undelivered_orders = @orders.undelivered_orders.select { |order| order.employee == employee }
    # @orders.select { |order| !order.delivered? && order[:employee] == employee }
    @view.display_orders(my_undelivered_orders)
  end

  def add
   # display_order
    meal_id = @view.ask_for("is the meal id").to_i
    meal = @meals.find(meal_id)
    customer_id = @view.ask_for("is the customer id").to_i
    customer = @customers.find(customer_id)
    employee_id = @view.ask_for("is the employee id").to_i
    employee = @employees.find(employee_id)
    attributes = {meal: meal, customer: customer, employee: employee}
    order = Order.new(attributes)
    @orders.add(order)
  end

  def mark_as_delivered(employee)
    order_id = @view.ask_for("is the order id").to_i
    order = @orders.find(order_id)
    order.deliver!
    @orders.add(order)
  end

  #private

 # def display_order(array)
 #   @view.display_orders(array)
 # end
end
