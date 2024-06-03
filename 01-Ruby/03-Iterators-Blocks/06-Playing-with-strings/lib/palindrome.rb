def palindrome?(a_string)
  # TODO: check if a_string is a palindrome
  return false if a_string.nil? || a_string.empty?
  new_string = a_string.downcase.gsub(/[^a-z0-9]/, "")
  new_string == new_string.reverse

end
