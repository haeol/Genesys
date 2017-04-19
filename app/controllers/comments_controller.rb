class CommentsController < ApplicationController

  def new
    render locals: {
      comment: Comment.new
    }
  end

  def create
    comment = new_comment
    if comment.save
      respond_to do |format|
        format.html { redirect_to post_path(params[:post_id]) }
        format.js
      end
    else
      render :new, alert: "Error" # TODO does this work?
    end
  end

  private
  def new_comment
    comment = Post.find(params[:post_id]).comments.build(comment_params)
    comment.user_id = current_user.id
    comment
  end

  def comment_params
    params.require(:comment).permit(:description)
  end

end
