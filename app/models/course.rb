class Course < ApplicationRecord
  belongs_to :user
  mount_uploader :image, :image2, :image3, :image4, :image5, ImageUploader
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
end
