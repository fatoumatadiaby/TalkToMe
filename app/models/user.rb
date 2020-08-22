class User < ApplicationRecord
    has_secure_password
    
    has_many :posts
    has_many :resources, through: :posts
   
    validates :name, presence: true
    validates :username, :email, presence: true, uniqueness: true
end
