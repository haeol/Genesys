class MyprofileController < ApplicationController
  def index
    posts = current_user.viewableposts.filter(params.slice(:starts_with))
    comments = current_user.comments.order(created_at: :DESC).filter(params.slice(:starts_with));
    render locals: {
      posts: posts,
      comments: comments
    }
  end

  def show
    render locals: {
      posts: User.find(params[:id]).viewableposts,
      comments: User.find(params[:id]).comments.order(created_at: :DESC)
    }
  end

end
