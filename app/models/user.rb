class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :courses, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :liked_courses, through: :likes, source: :course
  has_many :comments, dependent: :destroy
  
  def already_liked?(course)
    self.likes.exists?(course_id: course.id)
  end
end
