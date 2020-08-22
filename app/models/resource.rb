class Resource < ApplicationRecord
    has_many :users, through: :posts
    has_many :posts
   
    validates :disorder, :category, presence: true
    validates :resource_link, url: true

    
end
