class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 2..250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }
  attribute :likes_counter, :integer, default: 0
  attribute :comments_counter, :integer, default: 0
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  after_save :update_post_counter

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    comments.order(created_at: :asc).limit(5)
  end
end
