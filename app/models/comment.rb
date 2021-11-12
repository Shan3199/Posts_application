class Comment < ApplicationRecord
  validates :text, :presence => true, :length => { :maximum => 20 }


  belongs_to :post, optional: true
  belongs_to :user
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy
  # has_many :parent, class_name: 'Comment', foreign_key: 'parent_id'
  belongs_to :parent, class_name: "Comment", optional: true
  scope :parent_comment, -> { where(parent_id: nil) }
 

  def author?(author)
    user.eql?(author)
  end   

   def comment_user_like(user_id)
    # debugger
    comment_like = self.likes.where(user_id: user_id).last
  end

end
  