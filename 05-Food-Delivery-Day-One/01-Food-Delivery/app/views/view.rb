class View
  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} | #{meal.price}"
    end
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name} | #{customer.address}"
    end
  end

  def ask_for(input)
    puts "What #{input}?"
    user_input = gets.chomp
    return user_input
  end
end
