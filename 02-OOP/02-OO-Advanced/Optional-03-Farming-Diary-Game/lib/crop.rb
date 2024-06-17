class Crop
  attr_reader :grains

  def initialize
    @grains = 0
  end

  def water!
    @grains += 10
  end

  def ripe?
    if @grains >= 15
      true
    else
      false
    end
  end
end
