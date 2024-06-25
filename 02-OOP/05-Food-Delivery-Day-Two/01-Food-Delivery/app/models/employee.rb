class Employee

  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    if @role == "manager"
      true
    else
      false
    end
  end

  def rider?
    if @role == "rider"
      true
    else
      false
    end
  end
end
