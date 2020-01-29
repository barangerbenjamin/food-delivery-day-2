# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/order_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/controllers/orders_controller"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/sessions_controller"
require_relative "router"

csv_file_path = "data/meals.csv"
csv_file_path_customer = "data/customers.csv"
csv_file_path_employee = "data/employees.csv"
csv_file_path_order = "data/orders.csv"
employee_repo = EmployeeRepository.new(csv_file_path_employee)
meal_repo = MealRepository.new(csv_file_path)
meals_controller = MealsController.new(meal_repo)
customer_repo = CustomerRepository.new(csv_file_path_customer)
customers_controller = CustomersController.new(customer_repo)
sessions_controller = SessionsController.new(employee_repo)
order_repo = OrderRepository.new(csv_file_path_order, meal_repo, employee_repo, customer_repo)
orders_controller = OrdersController.new(meal_repo, employee_repo, customer_repo, order_repo)
router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)
router.run














