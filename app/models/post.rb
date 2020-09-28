class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, :presence => {:message => "must include title"}
    validates :body, :presence => {:message => "Body cannot be left blank"}
    validates :published_date, :presence => {:message => "please set a date"}
   scope :search, -> (term) {where("title LIKE ?", "%#{term}%")}

end
