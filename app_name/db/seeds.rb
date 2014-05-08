user = User.create(username: "johnathan",
                   about: "hello all",
                   email: "jw@jw.com",
                   password: "123")

post = user.posts.build(points: 10, title: "The Homestariest", link: "http://www.homestarrunner.com")
post.save

saved_story = SavedStory.new(user_id: user.id, post_id: post.id)
saved_story.save

comment = user.comments.build(points: 100, body: "Best url ever.")
post.comments << comment
comment.save

child = user.comments.build(points: 99, body: "Best comment ever")
post.comments << child
child.save
comment.comments << child

comments = []
File.readlines(APP_ROOT.join('db','data')).each_with_index do | line, index |
  comments << line if index.even?
end

30.times do | index |
  user = User.create(username: Faker::Name.first_name,
              about: Faker::Name.title,
              email: Faker::Internet.email,
              password: "123")

  post = user.posts.build(points: rand(80)+1, title:Faker::Name.title, link: Faker::Internet.url)
  post.save

  saved_story = SavedStory.new(user_id: user.id, post_id: post.id)
  saved_story.save

  comment = user.comments.build(points: 100, body: comments[index] )
  comment.save

  child = user.comments.build(points: 99, body: comments[index + 30])
  child.save
  comment.comments << child

  post.comments << comment
  post.comments << child
end






# if post.save
#   flash[:success] = "Post saved!"
#   redirect "/posts/#{post.id}"
# else
# else





