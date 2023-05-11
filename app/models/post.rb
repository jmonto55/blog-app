class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 2..250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
