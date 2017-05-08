class MyprofileController < ApplicationController

  def index
    location = params[:location] ? params[:location] : "posts"
    if location == "comments"
      comments = current_user.comments.order(created_at: :DESC).filter(params.slice(:starts_with))
  			.paginate(page: params[:page], per_page: 50)
    else
      location = "posts"
      posts = current_user.viewableposts.filter(params.slice(:starts_with))
        .paginate(page: params[:page], per_page: 50)
    end

    render locals: {
      posts: posts,
      comments: comments,
      location: location
    }
  end

  def show
    location = params[:location] ? params[:location] : "posts"
    user = User.find(params[:id])
    puts user
    if location == "comments"
      comments = user.comments.order(created_at: :DESC).filter(params.slice(:starts_with))
  			.paginate(page: params[:page], per_page: 50)
    else
      location = "posts"
      posts = user.viewableposts.filter(params.slice(:starts_with))
  			.paginate(page: params[:page], per_page: 50)
        
        
    end

    render locals: {
      location: location,
      user: user,
      posts: posts,
      comments: comments
    }
  end

end
