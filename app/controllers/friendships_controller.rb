class FriendshipsController < ApplicationController

  def index
	location = params[:location] ? params[:location] : "friendfeed"

	feed = []
	users = []
	notifs = []
	friends = []
	if location == "findusers"
		users = current_user.strangers.filter(params.slice(:starts_with))
			.paginate(page: params[:page], per_page: 50)
	elsif location == "notifications"
		notifs = current_user.pending_requests
			.paginate(page: params[:page], per_page: 50)
	elsif location == "friends"
		friends = User.where(id: current_user.friends.map(&:id))
			.filter(params.slice(:starts_with))
			.paginate(page: params[:page], per_page: 50)
	else
		location = "friendfeed"
	    feed = current_user.friend_feed
	    feed = friend_feed.where(friend_id: params[:friend_id]) if params[:friend_id].present?
	    feed = feed.order("created_at DESC")
			.paginate(page: params[:page], per_page: 50)
	end

    render locals: {
      feed: feed,
	  users: users,
	  notifications: notifs,
	  friends: friends,
      location: location
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
