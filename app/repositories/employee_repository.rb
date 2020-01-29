require "csv"
require_relative "../models/employee"
class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    return @employees
  end

  def find_employee(username)
    @employees.find { |employee| employee.username == username }
  end

  def add(employee)
    employee.id = @next_id
    @employees << employee
    @next_id += 1
    save_csv
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "username", "password", "role"]
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      employee_instance = Employee.new(row)
      @employees << employee_instance
    end
    @next_id = @employees.empty? ? 1 : @employees.last.id + 1
  end
end




