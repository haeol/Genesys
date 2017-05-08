class TagsController < ApplicationController

  def index
    tags = Tag.filter(params.slice(:starts_with)).order("name ASC")
      .paginate(:page => params[:page], :per_page => 50)

    render locals: {
      tags: tags#Tag.all.limit(50)
    }
  end

  def show
    posts = Tag.find(params[:id]).posts.order("created_at DESC")
      .paginate(:page => params[:page], :per_page => 50)

    render locals: {
      posts: posts
    }
  end

end
