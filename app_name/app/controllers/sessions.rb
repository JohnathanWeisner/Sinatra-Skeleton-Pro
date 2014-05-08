post '/sessions' do
  user = User.find_by_username(params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @error = "Username or password is incorrect"
    erb :"sessions/new"
  end
end

# Show the login page
get "/sessions/new" do
  erb :"sessions/new"
end



# Delete a session (clear the session cookie)
get "/sessions/logout" do
  session.clear

  redirect "/sessions/new"
end
