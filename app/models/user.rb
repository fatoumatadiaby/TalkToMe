class User < ApplicationRecord
    has_secure_password
    
    has_many :posts
    has_many :resources through: user
   
    validates :first_name, :last_name, presence: true
    validates :username, :email, presence: true, uniqueness: true
end
