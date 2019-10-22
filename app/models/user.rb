class User < ApplicationRecord
    has_secure_password
    # connect the join table
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users
    # connect the other relationships
    has_many :lineups
    has_many :likes
    has_many :comments
    belongs_to :team
    #validations
    validates :username, uniqueness: :true
end
