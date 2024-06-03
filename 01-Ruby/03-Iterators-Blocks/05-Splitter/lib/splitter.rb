def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.

  array_size = []
  array_other = []

  array.each do |element|
    if element.length == size
      array_size << element
    else
      array_other << element
    end
  end

  array_size.sort!
  array_other.sort!

  [array_size, array_other]
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.

  array_if_yield_true = []
  array_if_no_block = []

  array.each do |element|

    if yield(element)
      array_if_yield_true << element
    else
      array_if_no_block << element

    end
  end

  [array_if_yield_true, array_if_no_block]

end
