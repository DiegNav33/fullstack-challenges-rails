class PostsView
  # TODO: implement methods called by the PostsController

  def display_all(posts)
    posts.each_with_index do |post, index|
      puts "#{index + 1}. (ID:#{post.id}) #{post.title}: #{post.url} => #{post.votes} votes"
    end
  end

  def message_empty_list
    puts "┌───────────────────────────────────────┐"
    puts "│      There is no posts yet !          |"
    puts "└───────────────────────────────────────┘"
  end

  def error_message
    puts "┌──────────────────────────────────────────┐"
    puts "│ ⚠️  An error occurred, please try again!  │"
    puts "└──────────────────────────────────────────┘"
  end

  def ask_user_title
    puts "Enter a title for the post"
    return gets.chomp.capitalize
  end

  def ask_user_url
    puts "Enter the url of the post"
    return gets.chomp
  end

  def ask_user_index
    puts "Pick with the Index number!"
    return gets.chomp.to_i - 1
  end

end
