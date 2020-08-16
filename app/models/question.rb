class Question < ApplicationRecord
  default_scope { order(created_at: :desc) }
  has_rich_text :question_text
  
  has_many :comments, as: :commentable
end
