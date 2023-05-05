class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  def update_likes_counter
    post.likescounter.nil? ? post.update(likescounter: 1) : post.update(likescounter: post.likescounter + 1)
  end
end
