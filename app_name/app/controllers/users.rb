post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/" + params[:last_visited]
  else
    erb :login
  end
end

get '/newslogin' do
  @last_visited = params[:whence]
  erb :login
end

get '/user' do
  params[:username]
end

get '/submitted' do
  params[:username]
end

# { "user" => { "username" => "sdfs", "password" => "asdfahsdfksajh"}, "last_visited" }
