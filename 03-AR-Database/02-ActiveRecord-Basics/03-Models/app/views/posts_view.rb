class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`

  def display(posts)
    posts.each do |post|
      puts "#{post.id}. #{post.title}: #{post.url} => #{post.votes} vote(s)"
    end
  end

  def ask_user_title
    puts "Enter a title: "
    return gets.chomp
  end

  def ask_user_url
    puts "Enter an URL: "
    return gets.chomp
  end

  def ask_user_id
    puts "Pick with the id!"
    return gets.chomp.to_i
  end
end
