get '/item' do
  @post_id = params[:id]
  @comments = Post.find(@post_id).comments
  @html = ""
  @comments.each do |comment|
    if comment.comment_id.nil?
      @html += "<ul><li> #{comment.body} username: #{User.find(comment.user_id).username} </li>"
      @html += thread_comments(comment.comments)
      @html += "</ul>"
    end
  end

  erb :comments
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

