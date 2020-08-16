class Comment < ApplicationRecord
  has_rich_text :comment_text
  belongs_to :user
  
  belongs_to :commentable, polymorphic: true
end
