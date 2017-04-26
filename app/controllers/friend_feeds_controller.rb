class FriendFeedsController < ApplicationController

  def new
  end

  def create
    friends = params[:friends]
    friends.each do |friend|
      f = User.find(friend).friend_feed.build(friend_id: params[:friend_id], post_id: params[:post_id])
      f.save
    end

    redirect_to :back

		#feed = current_user.friendships.build(friend_id: params[:friend_id])
    #feed.save
  end

  def destroy
		FriendFeed.find_by(id: params[:feed_id]).destroy
		redirect_to :back
  end

end
