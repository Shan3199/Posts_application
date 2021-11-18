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
    # debugger
    user.eql?(author) 
  end  

  def post_user_like(user_id)
    # debugger
    post_like = self.likes.where(user_id: user_id).last
  end

  def user_role(current_user)
    # debugger
    current_user.has_role? :admin
  end

  scope :not_current_user, ->(current_user) { where.not(user_id: current_user) }

  # scope :title_demo, -> {where(title: "demo")}

  # scope :today_post, -> {where(created_at: DateTime.now.all_day)}

  # def self.class_method_1
  #   debugger
  #   Post.where(title: "demo")
  # end

  # def self.class_method_2
  #   Post.where(created_at: DateTime.now.all_day)
  # end

end
