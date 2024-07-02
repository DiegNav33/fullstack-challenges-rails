require_relative "../models/post"
require_relative "../views/posts_view"

class PostsController

  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    posts = Post.all
    if posts.empty?
      @view.message_empty_list
    else
      @view.display_all(posts)
    end
  end

  def create
    title = @view.ask_user_title
    url = @view.ask_user_url
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    posts = Post.all
    if posts.empty?
      @view.message_empty_list
    else
      index
      selected_index= @view.ask_user_index
      if selected_index >= 0 && selected_index < posts.length
        post = posts[selected_index]
        post = Post.find(post.id)
        new_title = @view.ask_user_title
        new_url = @view.ask_user_url
        post.title = new_title unless new_title.empty?
        post.url = new_url unless new_url.empty?
        post.save
      else
        @view.error_message
      end
    end
  end

  def destroy
    posts = Post.all
    if posts.empty?
      @view.message_empty_list
    else
      index
      selected_index = @view.ask_user_index
      if selected_index >= 0 && selected_index < posts.length
        post = posts[selected_index]
        post = Post.find(post.id)
        post.destroy
      else
        @view.error_message
      end
    end
  end

  def upvote
    posts = Post.all
    if posts.empty?
      @view.message_empty_list
    else
      index
      selected_index = @view.ask_user_index
      if selected_index >= 0 && selected_index < posts.length
        post = posts[selected_index]
        post = Post.find(post.id)
        post.votes += 1
        post.save
      else
        @view.error_message
      end
    end
  end
end
