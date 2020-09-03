class Post < ApplicationRecord
    belongs_to :user

    has_many :comments, dependent: :destroy
  #show the most recent post on user home page
   
#add comment table to post
end
