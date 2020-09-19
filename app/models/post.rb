class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
 
   scope :search, -> (term) {where("title LIKE ?", "%#{term}%")}

end
