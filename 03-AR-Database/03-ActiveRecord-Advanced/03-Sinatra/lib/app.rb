require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"

require_relative "../config/application"

set :root, File.expand_path("..", __dir__)
set :views, proc { File.join(root, "app/views") }
set :bind, '0.0.0.0'

after do
  ActiveRecord::Base.connection.close
end

# Route pour la page d'accueil affichant tous les posts
get "/" do
  @posts_desc = Post.all.order(votes: :desc)
  @post = Post.new
  erb :posts # Do not remove this line
end

post "/posts" do
  title = params[:title]
  url = params[:url]
  user = User.first
  @post= Post.create(title: title, url: url, user: user)

  if @post.persisted?
    redirect to('/')
  else
    erb :new_post
  end
end

put "/posts/:id/upvote" do
  post = Post.find(params[:id])
  post.votes += 1
  post.save
  redirect '/'
end

delete "/posts/:id/delete" do
  post = Post.find(params[:id])
  post.destroy
  post.save
  redirect "/"
end


# TODO: add more routes to your app!
