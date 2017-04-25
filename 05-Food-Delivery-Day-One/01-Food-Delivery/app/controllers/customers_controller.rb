require_relative '../views/view'
require_relative '../models/customer'


class CustomersController
  def initialize(customers)
    @customers = customers
    @view = View.new
  end

  def list
    display_customers
  end

  def add
    display_customers
    name = @view.ask_for("is the name")
    address = @view.ask_for("is the address")
    attributes = {name: name, address: address}
    customer = Customer.new(attributes)
    @customers.add(customer)
  end

  private
  def display_customers
    @view.display_customers(@customers.all)
  end


end
