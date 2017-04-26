# require_relative 'employee_repository'

class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    puts "Welcome to meals on wheel!"
    puts "           --           "

    while @running
      #@customers_controller.sign_in
      user = @sessions_controller.sign_in
      if user.manager?
        display_tasks_manager
        man_action = gets.chomp.to_i
        print `clear`
        route_man_action(man_action)
      else
        display_tasks_delivery_guy
        action = gets.chomp.to_i
        print `clear`
        route_action(action)
      end
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @orders_controller.list_my_orders(user)
    when 2 then @orders_controller.mark_as_delivered(user)
    when 8 then @sessions_controller.sign_out
    when 9 then stop
    else
      puts "Please press 1, 2, 8 or 9"
    end
  end

  def route_morderan_action(man_action)
    case man_action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.list_undelivered_orders
    when 6 then @orders_controller.add
    when 8 then @sessions_controller.sign_out
    when 9 then stop
    else
      puts "Please press 1, 2, 3, 4, 5, 6, 8 or 9"
    end
  end

  def stop
    @running = false
  end

  def display_tasks_manager
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Add a new meals"
    puts "3 - List all customers"
    puts "4 - Add a new customers"
    puts "5 - List all undelivered orders"
    puts "6 - Add a new order"
    puts "8 - Signout"
    # puts "6 - Mark recipe as done"
    puts "9 - Stop and exit the program"
  end

  def display_tasks_delivery_guy
    puts ""
    puts "What do you want to do next?"
    puts "1 - List my undelivered orders"
    puts "2 - Mark order as delivered"
    puts "8 - Signout"
    # puts "5 - Filter recipes by time"
    # puts "6 - Mark recipe as done"
    puts "9 - Stop and exit the program"
  end
end
