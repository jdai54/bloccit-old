require "random_data"
# Create Posts
50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by(title: 'First Post', body: 'This is a test post')

Comment.create_with(title: 'First Post').find_or_create_by(body: 'This looks nice')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
