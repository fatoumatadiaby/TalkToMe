class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments
    
    validates :title, presence: true
    validates :body, presence: true 
    validates :published_date, presence: true
   scope :search, -> (term) {where("title LIKE ?", "%#{term}%")}

end
