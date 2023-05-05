class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 2..250 }
  validates :commentscounter, comparison: { greater_than_or_equal_to: 0 }
  validates :likescounter, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  def update_post_counter
    author.postscounter.nil? ? author.update(postscounter: 1) : author.update(postscounter: author.postscounter + 1)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
