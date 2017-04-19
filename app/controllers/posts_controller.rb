class PostsController < ApplicationController
  def index
    @posts = Post.filter(params.slice(:name, :tag, :tag_id, :starts_with))
  end

  def new
    render locals: {
      post: Post.new
    }
    #@post = Post.new
  end

  # TODO user required before calling
  def create
    post = current_user.posts.build(post_params)
    post.add_tags(params[:tags])
    if post.save
      redirect_to dashboard_index_path, notice: "Post created"
    else
      render :new, alert: "Error" # TODO does this work?
    end
  end

  def repost(post)
    repost = post.copy            # function defined in Post.rb model
    if not repost.save
      render :new, alert: "Error" # TODO does this work?
    end
  end

  def show
    render locals: {
        post: Post.find(params[:id])
    }
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    #when delete post, delete related comment first
    #@comment = Comment.where("post_id=?", @post.id)
    #@comment.destroy
    @post.destroy

    if @post.destroyed?
      redirect_to myprofile_index_path, notice: "Post destroyed"
    else
      render :new, alert: "Error" # TODO does this work?
    end
  end

  private
  def post_params
    params.require(:post)
          .permit(:url, :rating, :description, :name)
          .merge(original_poster_id: current_user.id)
  end

end
