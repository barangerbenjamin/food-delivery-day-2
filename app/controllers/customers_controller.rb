require_relative "../views/customers_view"
require_relative "../models/customer"
class CustomersController
  def initialize(customer_repository)
    # MealRepository.new(csv_file_path)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end
  # list customers
  def list
    # 1. get all the customers -> meal_repo
    customers = @customer_repository.all
    # 2. display customers -> customers_view
    @customers_view.display(customers)
  end

  # add customers
  def create
    #1. Ask user for name and price -> customers_view
    name = @customers_view.ask_for("name")
    address = @customers_view.ask_for("address")
    customer_hash = { name: name, address: address }
    #2. Create an instance of customers with those properties
    customer_instance = Customer.new(customer_hash)
    #3. add Customer instance to repo
    @customer_repository.add(customer_instance)
  end
end
