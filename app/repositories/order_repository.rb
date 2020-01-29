require "csv"
require_relative "../models/order"

class OrderRepository

  def initialize(csv_file_path, meal_repository, employee_repository, customer_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def add(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      order = Order.new(row)
      # id = row[:id].to_i
      # delivered = row[:delivered] == "true"
      # meal_instance = @meal_repository.find(row[:meal_id].to_i)
      # employee_instance = @employee_repository.find(row[:employee_id].to_i)
      # customer_instance = @customer_repository.find(row[:customer_id].to_i)
      # order = Order.new(id: id, delivered: delivered, meal: meal_instance
      #                    employee: employee_instance, customer: customer_instance)
      @orders << order
    end
    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id","delivered","meal_id","employee_id","customer_id"]
      @orders.each do |order|
        csv << [order.id, order.delivered, order.meal.id, order.employee.id, order.customer.id]
      end
    end
  end
end















