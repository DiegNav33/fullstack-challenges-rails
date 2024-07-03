# TODO: Write a seed
require "faker"

5.times do
  user = User.new(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email
  )
  user.save

  (5..10).to_a.sample.times do
    post = Post.new(
      title: Faker::Commerce.product_name,
      url: Faker::Internet.url,
      votes: (0..1000).to_a.sample,
      user: user
    )
    post.save
  end
end
