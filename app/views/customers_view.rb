class CustomersView
  def display(customers)
    customers.each_with_index do |customer_instance, index|
      puts "#{index + 1}. #{customer_instance.name}, #{customer_instance.address}"
    end
  end

  def ask_for(something)
    puts "What is the #{something}?"
    return gets.chomp
  end
end
