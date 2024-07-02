require "json"
require "rest-client"

TOP_STORIES_URL = "https://hacker-news.firebaseio.com/v0/topstories.json"

def story_url(id)
  "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
end
#JSON.parse va transformer la chaine JSON en objet ruby comme un array ou hash et Resclient.get retourne une chaine JSON representant un tableau de posts dans ce cas la
post_ids = JSON.parse(RestClient.get(TOP_STORIES_URL))

post_ids.take(10).each do |id|
  hacker_news_post = JSON.parse(RestClient.get(story_url(id)))
  post = Post.new(
    title: hacker_news_post["title"],
    url: hacker_news_post["url"],
    votes: hacker_news_post["score"]
  )
  post.save
  puts "[#{post.votes}] #{post.title} - #{post.url}"
end
