#***************************
# Read
#***************************
get "/comments" do
  @comment = Comment.all

  erb :"comments/index"
end


# show one comment by id (show)
get "/comments/show/:id" do
  @comment = Comment.find(params[:id])

  erb :"comments/show"
end


# show the form to create a new
get "/comments/new" do
  erb :"comments/new"
end


# create a new comment record (create)
post "/comments" do
  @
  @comment = Comment.new(body: params[:body], user:)

  if @comment.save
    redirect "/comments"
  else
    erb :"comments/new"
  end
end


#***************************
# Update
#***************************
get "/comments/:id/edit" do
  @comment = Comment.find(params[:id])

  erb :"/comments/edit"
end

# update the comment by id (update)
put "/comments/:id" do
  @comment = Comment.find(params[:id])
  if @comment.update(params[:comment])
    redirect "/comments/#{@comment.id}"
  else
    erb :"comments/edit"
  end
end



#***************************
# delete a comment by id (destroy)
#***************************

delete "/comments/:id" do
  @comment = Comment.find(params[:id])
  @comment.delete

  redirect "/comments"
end

get '/comments' do
  @comments = Comment.all
  @html = ""

  @comments.each do |comment|
    if comment.comment_id.nil?
      @html += "<ul><li> #{comment.body} username: #{User.find(comment.user_id).username} </li>"
      @html += thread_comments(comment.comments)
      @html += "</ul>"
    end
  end

  erb :"comments/index"
end

def thread_comments( comments )
  return "" if comments.empty?
  html = "<ul>"
  comments.each do |comment|
    html += "<li> #{comment.body} username: #{User.find(comment.user_id).username} </li>"
    html += thread_comments(comment.comments) unless comment.comments.empty?
  end
  html += "</ul>"
  return html
end
