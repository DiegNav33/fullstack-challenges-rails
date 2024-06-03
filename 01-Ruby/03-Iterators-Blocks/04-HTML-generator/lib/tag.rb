def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  # attribute_html = ""
  if attributes
    attributes = " #{attributes[0]}=\"#{attributes[1]}\""
  end
  content = yield if block_given?
  "<#{tag_name}#{attributes}>#{content}</#{tag_name}>"
end

puts tag("script", ["src", "https://kit.fontawesome.com/b5f95cb708.js"])
puts tag("h1") {|content| "Titre principal"}
