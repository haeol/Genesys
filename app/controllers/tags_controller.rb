class TagsController < ApplicationController

  def index
    render locals: {
      tags: Tag.all.limit(50)
    }
  end

  def show
    render locals: {
      posts: Tag.find(params[:id]).posts
    }
  end

end
