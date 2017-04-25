class Employee
  attr_reader :username, :password, :role
  attr_accessor :id
  def initialize(attributes = {})
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
    @id = attributes[:id]
  end

  def manager?
    return @role == "manager"
  end

  def delivery_guy?
    return @role == "delivery_guy"
  end

end
