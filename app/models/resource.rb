class Resource < ApplicationRecord
   has_many :users
    validates :disorder, :category, presence: true
    validates :resource_link, url: true

    
end
