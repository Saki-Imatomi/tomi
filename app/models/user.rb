class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy

  has_many :posts, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
 
  has_many :loves, dependent: :destroy
  has_many :loved_posts, through: :loves, source: :post


  has_many :comments, dependent: :destroy

  has_many :dogs, dependent: :destroy
  
  def already_liked?(tweet)
       self.likes.exists?(tweet_id: tweet.id)
  end

  def already_loved?(post)
       self.loves.exists?(post_id: post.id)
  end

  
 end
