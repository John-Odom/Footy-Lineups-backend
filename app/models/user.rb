class User < ApplicationRecord
    has_secure_password
    has_many :lineups
    has_many :likes
    has_many :comments
    belongs_to :team
    validates :username, uniqueness: :true
end
