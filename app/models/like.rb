class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post
  after_save :update_like_counter

  def update_like_counter
    post.increment!(:likes_counter)
  end
end
