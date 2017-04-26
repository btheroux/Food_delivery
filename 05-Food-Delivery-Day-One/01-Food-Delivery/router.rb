# require_relative 'employee_repository'

class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
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
    when 1 then @meals_controller.list
    when 2 then @sessions_controller.sign_out
    # when 5 then @controller.filter_by_time
    # when 6 then @controller.mark_as_done
    when 3 then stop
    else
      puts "Please press 1, 2 or 3"
    end
  end

  def route_man_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then @sessions_controller.sign_out
    # when 6 then @controller.mark_as_done
    when 9 then stop
    else
      puts "Please press 1, 2, 3, 4, 8 or 9"
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
    puts "4 - Add a new customer"
    puts "8 - Signout"
    # puts "6 - Mark recipe as done"
    puts "9 - Stop and exit the program"
  end

  def display_tasks_delivery_guy
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Signout"
    # puts "5 - Filter recipes by time"
    # puts "6 - Mark recipe as done"
    puts "3 - Stop and exit the program"
  end
end
