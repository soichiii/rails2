# app/models/user.rb

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms
  has_many :reservations
  has_one_attached :avatar
  

  
  

  def name
    username
  end

  def introduction
    description
  end

  validates :username, presence: true
  validates :description, length: { maximum: 255 }
end
