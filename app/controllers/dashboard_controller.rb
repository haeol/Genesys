class DashboardController < ApplicationController

  def index
    #@posts = Post.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    @posts = Post.paginate(:page => params[:page], :per_page => 50)
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

end
