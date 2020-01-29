class OrdersView
  def display(orders)
    orders.each do |order|
      puts "#{order.meal.name} - #{order.employee.username} - #{order.customer.name}"
    end
  end

  def my_orders_display(orders)
    orders.each do |order|
      puts "#{order.id} #{order.customer.name} - #{order.meal.name}"
    end
  end

  def ask_for(something)
    puts "#{something}?"
    gets.chomp
  end
end