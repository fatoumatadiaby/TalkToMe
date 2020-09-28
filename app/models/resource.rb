class Resource < ApplicationRecord
   has_many :users
    validates :disorder, :category, presence: true
    validates :resource_link, url: true

    scope :search, -> (term) {where("disorder LIKE ?", "%#{term}%")}
    scope :by_category, -> (category) {where("category = ?", category)}
    # scope :by_disorder, -> (disorder) {where("disorder = ?", disorder)}
end
