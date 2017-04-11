class DashboardController < ApplicationController
  def index
    #TODO offset and infinite scrolling instead of limit 50
    @posts = Post.filter(params.slice(:name, :tag, :tag_id, :starts_with)).limit(50)
  end
end
