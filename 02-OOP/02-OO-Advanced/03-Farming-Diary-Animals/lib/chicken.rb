require_relative "animal"

class Chicken < Animal

  attr_accessor :gender
  attr_reader :eggs

  def initialize(gender)
    super()
    @gender = gender
    @eggs = 0
  end

  def talk
    if @gender != "female"
      return "cock-a-doodle-doo"
    else
      return "cluck cluck"
    end
  end

  def feed!
    super()
    if @gender != "female"
      @eggs
    else
      @eggs += 2
    end
  end
end
