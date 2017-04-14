class DashboardController < ApplicationController
  def index
    #TODO offset and infinite scrolling instead of limit 50
    posts = Post.filter(params.slice(:name, :tag, :tag_id, :starts_with)).limit(50)
    render locals: {
      posts: posts,
      tags: Tag.all.limit(20)# TODO trending or defaults
    }
    
    respond_to do |format|
      format.html # calls index.html.erb
      format.js # calls index.js.erb
    end
  end

  def is_active?(link)
    current_page?(link) ? "active" : ""
  end
  helper_method :is_active?
end
