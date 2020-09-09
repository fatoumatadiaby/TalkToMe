class User < ApplicationRecord
    has_secure_password
    
    has_many :posts
    has_many :resources
    has_many :comments, through: :posts
    has_many :comments, dependent: :destroy

    validates :name, presence: true
    validates :username, :email, presence: true, uniqueness: true

    def self.create_with_omniauth(auth)
  
        user = find_or_create_by(uid: auth["uid"], provider:  auth[
            "provider"
        ])
        user.email = "#{auth["uid"]}@#{auth['provider']}.com"
        user.password = auth["uid"]
        user.name = auth["info"]["name"]
        user.username = auth["info"]["name"]
       
          user.save!
          user
       end
end
