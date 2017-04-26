class FriendFeed < ApplicationRecord
  belongs_to :user

  # TODO not being used
  def share(users)
    users.each do |user|
      f = user.friend_feed.build(friend_id: current_user, post_id: params[:post_id])
      f.save
    end
  end

  def post
    Post.find(post_id)
  end

  def friend_name
    User.find(friend_id).email
  end

end
