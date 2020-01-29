require_relative "../views/orders_view"

class OrdersController
  def initialize(meal_repository, employee_repository, customer_repository, order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders_view = OrdersView.new
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    id = @orders_view.ask_for(:order_id).to_i
    order = @order_repository.find(id)
    order.deliver!
    @order_repository.save_csv
  end

  def list_my_orders(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee == employee }
    @orders_view.my_orders_display(orders)
  end

  def add
    meal_id = @orders_view.ask_for(:meal_id).to_i
    meal = @meal_repository.find(meal_id)
    employee_id = @orders_view.ask_for(:employee_id).to_i
    employee = @employee_repository.find(employee_id)
    customer_id = @orders_view.ask_for(:customer_id).to_i
    customer = @customer_repository.find(customer_id)
    order = Order.new(meal: meal, employee: employee, customer: customer)
    @order_repository.add(order)
  end
end








