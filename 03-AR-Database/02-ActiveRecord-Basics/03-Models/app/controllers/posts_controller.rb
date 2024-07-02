require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    posts = Post.all
    @view.display(posts)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask_user_title
    url = @view.ask_user_url
    Post.create(title: title, url: url)
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    index
    id_selected = @view.ask_user_id
    new_title = @view.ask_user_title
    new_url = @view.ask_user_url
    post = Post.find(id_selected)
    post.update(title: new_title.empty? ? post.title : new_title, url: new_url.empty? ? post.url : new_url)
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    index
    id_selected = @view.ask_user_id
    post = Post.find(id_selected)
    post.destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    index
    id_selected = @view.ask_user_id
    post = Post.find(id_selected)
    new_rate = post.votes + 1
    post.update(votes: new_rate)
  end
end
