class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    belongs_to :resource
    scope :post_comments, -> { where("post_id = ?", params[:id])}

end
