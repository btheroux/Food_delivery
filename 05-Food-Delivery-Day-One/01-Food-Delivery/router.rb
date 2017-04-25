# TODO: implement the router of your app.
class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to meals on wheel!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    # when 3 then @controller.destroy
    # when 4 then @controller.search
    # when 5 then @controller.filter_by_time
    # when 6 then @controller.mark_as_done
    when 3 then stop
    else
      puts "Please press 1, 2 or 3"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all meals"
    puts "2 - Create a new meals"
    # puts "3 - Destroy a recipe"
    # puts "4 - Import recipe from LetsCookFrench"
    # puts "5 - Filter recipes by time"
    # puts "6 - Mark recipe as done"
    puts "3 - Stop and exit the program"
  end
end
