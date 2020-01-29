class Employee
  attr_accessor :id
  attr_reader :username, :password
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role] # "manager" || "delivery_guy"
  end

  def manager?
    @role == "manager"
  end
end