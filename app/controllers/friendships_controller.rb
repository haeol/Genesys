class FriendshipsController < ApplicationController

  def index
    friend_feed = current_user.friend_feed
    p = params.permit(:friend_id)
    p.each do |key, value|
      friend_feed = friend_feed.public_send(key, value) if value.present?
    end
    friend_feed.order("created_at DESC")

    render locals: {
      feed: friend_feed
    }
  end


  def create
		friendship = current_user.friendships.build(friend_id: params[:friend_id])
		if friendship.save
			flash[:notice] = "Friend requested."
			redirect_to :back
		else
			flash[:error] = "Unable to request friendship."
			redirect_to :back
		end
  end

  def update
		friendship = Friendship.find_by(id: params[:id])
    friendship.update(accepted: true)
		if friendship.save
			redirect_to root_url, notice: "Successfully confirmed friend!"
		else
			redirect_to root_url, notice: "Sorry! Could not confirm friend!"
		end
  end

  def destroy
		Friendship.find_by(id: params[:id]).destroy
		flash[:notice] = "Removed friendship."
		redirect_to :back
  end
  
end
