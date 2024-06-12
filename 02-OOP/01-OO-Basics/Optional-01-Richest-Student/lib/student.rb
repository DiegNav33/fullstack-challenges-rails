class Student
  include Comparable
  attr_reader :name
  attr_accessor :nbr_five, :nbr_ten, :nbr_twenty

  def initialize(name,nbr_five, nbr_ten, nbr_twenty)
    @name = name
    @nbr_five = nbr_five
    @nbr_ten = nbr_ten
    @nbr_twenty = nbr_twenty
  end

  def wealth
    total_wealth = nbr_five * 5 + nbr_ten * 10 + nbr_twenty * 20
    total_wealth
  end

  def <=>(other)
    self.wealth <=> other.wealth
  end
end
