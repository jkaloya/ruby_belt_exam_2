class User < ActiveRecord::Base
    has_secure_password
    has_many :ideas
    has_many :likes
    has_many :ideas_liked, through: :likes, source: :idea
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :name, :alias, :email, presence: true
    validates :password, presence: true
    validates :password, on:create, length: { minimum: 6 }
    validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
