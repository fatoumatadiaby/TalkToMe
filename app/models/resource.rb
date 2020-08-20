class Resource < ApplicationRecord
    has_many :resources through: post
   
   
    validates :disorder, :category, presence: true
    validates :resource_link, url: true

    
end
