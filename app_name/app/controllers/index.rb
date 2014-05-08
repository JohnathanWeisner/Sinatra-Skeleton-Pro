get '/' do
  if logged_in?
    erb :"comments/index"
  else
    redirect "/sessions/new"
  end
end




