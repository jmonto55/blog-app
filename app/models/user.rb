class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }
  attribute :posts_counter, :integer, default: 0
  has_many :posts, foreign_key: :user_id
  has_many :comments, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id

  def last_three_posts
    posts.order(created_at: :asc).limit(3)
  end

  def retrieve_all_user_posts
    posts.includes(:comments, comments: :author)
  end
end
