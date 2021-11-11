class Post < ApplicationRecord
  acts_as_paranoid
  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :body, :presence => true, :length => { :maximum => 50000 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_one_attached :image

  has_rich_text :body

  def author?(author)
    user.eql?(author)
  end  

  def post_user_like(user_id)
    # debugger
    post_like = self.likes.where(user_id: user_id).last
  end


  scope :not_current_user, ->(current_user) { where.not(user_id: current_user) }
end
