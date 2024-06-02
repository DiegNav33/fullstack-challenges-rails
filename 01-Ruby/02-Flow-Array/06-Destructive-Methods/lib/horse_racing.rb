def horse_racing_format!(race_array)
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.
  race_array.each_with_index do |element, index|
    element.insert(0, "#{index + 1}-")
    element.insert(-1, "!")
  end
  race_array.reverse!
end
