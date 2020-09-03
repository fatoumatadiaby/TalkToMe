class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    validates :username, :body, :post_id,  presence: true
end
