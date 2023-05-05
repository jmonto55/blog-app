class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  def update_comments_counter
    post.update(likescounter: post.likescounter + 1)
  end
end
