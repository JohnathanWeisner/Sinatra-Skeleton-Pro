before '*' do
  current_user
end

get '/' do
  @posts = Post.all
  erb :index
end




