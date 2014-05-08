post '/users/new' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/comments"
  else
    erb :"sessions/new"
  end
end
