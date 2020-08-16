class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         has_many :follows, foreign_key: :following_user_id
         has_many :following, through: :follows, source: 'followed_user'
         
         has_many :questions
         
         
         def feed
           Question.joins("INNER JOIN follows ON follows.followed_user_id = questions.user_id").where('follows.following_user_id = ?', self.id)
         end
         
         
         def follows?(other_user)
           Follow.where(following_user_id: self.id, followed_user_id: other_user.id).first.present?
         end
end
