class View
  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} | #{meal.price}"
    end
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} | #{customer.address}"
    end
  end

  def display_orders(orders)
    orders.each do |order|
      puts "#{order.customer.name} #{order.meal.name}"
    end
  end

  def ask_for(input)
    puts "What #{input}?"
    user_input = gets.chomp
    return user_input
  end

  def ask_for_username
    puts "what is your username?"
    return user_username = gets.chomp
  end

  def ask_for_password
    puts "what is your password?"
    return user_password = gets.chomp
  end
end
