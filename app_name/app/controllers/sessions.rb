post '/login' do
  user = User.find_by_username(params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/" + params[:last_visited]
  else
    @error = "Username or password is incorrect"
    erb :login
  end
end
