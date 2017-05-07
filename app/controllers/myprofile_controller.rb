class MyprofileController < ApplicationController

  def index
    posts = current_user.viewableposts.filter(params.slice(:starts_with))
    comments = current_user.comments.order(created_at: :DESC).filter(params.slice(:starts_with))
    location = params[:location] ? params[:location] : "posts"

    render locals: {
      posts: posts,
      comments: comments,
      location: location
    }
  end

  def show
    render locals: {
      posts: User.find(params[:id]).viewableposts,
      comments: User.find(params[:id]).comments.order(created_at: :DESC).filter(params.slice(:starts_with))
    }
  end

end
