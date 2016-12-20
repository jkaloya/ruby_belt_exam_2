class Idea < ActiveRecord::Base
    belongs_to :user
    has_many :likes
    has_many :times_liked, through: :likes, source: :user
    validates :content, presence: true
    validates :content, length: { minimum: 2 }
end
