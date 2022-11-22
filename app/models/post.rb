class Post < ApplicationRecord
  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :body, :presence => true, :length => { :maximum => 50000 }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  
  has_one_attached :image

  after_create :create_notification

  has_rich_text :body
  
  scope :not_current_user, ->(current_user) { where.not(user_id: current_user) }

  def author?(author)
    user.eql?(author)
  end  

  def post_user_like(user_id)
    post_like = self.likes.where(user_id: user_id).last
  end


  def create_notification
    notification = Notification.find_or_initialize_by(headings: "Post Notification", contents: "#{self.user.first_name} has created a new post.")
    notification.save
  end


end
