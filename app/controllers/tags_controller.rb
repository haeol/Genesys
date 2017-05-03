class TagsController < ApplicationController

  def index
    tags = Tag.filter(params.slice(:starts_with))
    render locals: {
      tags: tags#Tag.all.limit(50)
    }
  end

  def show
    render locals: {
      posts: Tag.find(params[:id]).posts
    }
  end

end
