require_relative "animal"

class Cow < Animal

  attr_reader :milk

  def initialize
    super()
    @milk = 0
  end

  def talk
    "moo"
  end

  def feed!
    super()
    @milk += 2
  end

end
