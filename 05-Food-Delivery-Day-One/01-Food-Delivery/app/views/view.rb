class View
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} | #{meal.price}"
    end
  end

  def ask_for(input)
    puts "What #{input}?"
    user_input = gets.chomp
    return user_input =~ /\d+/ ? user_input.to_i : user_input
  end
end
