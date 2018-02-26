class Idea < ActiveRecord::Base
    belongs_to :users
    has_many :likes
    has_many :liked_by, through: :likes, source: :user
end
