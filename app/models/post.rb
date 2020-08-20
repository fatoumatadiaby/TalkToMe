class Post < ApplicationRecord
    belongs_to :user
    belongs_to :resource

    def self.recent_post
        
end
