class MealsView
  def display(meals)
    meals.each_with_index do |meal_instance, index|
      puts "#{index + 1}. #{meal_instance.name}, #{meal_instance.price}"
    end
  end

  def ask_for(something)
    puts "What is the #{something}?"
    return gets.chomp
  end
end
