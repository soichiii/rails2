# app/models/room.rb

class Room < ApplicationRecord
  belongs_to :user

  validates :name, :detail, :address, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }

  has_one_attached :image

  def display_image
    image.attached? ? image : default_image_url
  end

  def default_image_url
    ActionController::Base.helpers.asset_url('default-image-4e0ac6b8d01335b5b22fe6586af13644ae51dddb6aeabf35b9174e80f13cd09d.png')
  end

  has_many :reservations
end
