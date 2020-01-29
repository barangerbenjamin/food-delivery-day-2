# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    employee = @sessions_controller.sign_in
    while @running
      if employee.manager?
        display_manager_menu
        choice = gets.chomp.to_i
        route_manager_action(choice)
      else
        display_delivery_guy_menu
        choice = gets.chomp.to_i
        route_delivery_guy_action(choice)
      end
    end
  end

  private

  def route_manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.create
    when 3 then @customers_controller.list
    when 4 then @customers_controller.create
    when 5 then @running = false
    end
  end

  def route_delivery_guy_action(choice)
    case choice
      when 1 then puts "TODO today :) "
      when 2 then puts "TODO today :) "
      when 3 then @running = false
    end
  end

  def display_manager_menu
    puts "Welcome!"
    puts "1. List all meals"
    puts "2. Add a meal"
    puts "3. List all customers"
    puts "4. Add a customer"
    puts "5. Exit"
  end

  def display_delivery_guy_menu
    puts "Welcome!"
    puts "1. List my undelivered orders"
    puts "2. Mark an order as delivered"
    puts "3. Exit"
  end
end
