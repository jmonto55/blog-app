class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }
  attribute :posts_counter, :integer, default: 0
  has_many :posts, foreign_key: :user_id
  has_many :comments, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id

  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end

  def retrieve_all_user_posts
    posts.includes(:comments, comments: :author)
  end
end
