class User < ApplicationRecord
    has_secure_password
    has_many :lineups
    has_many :likes
    has_many :comments
    validates :username, uniqueness: :true
end
