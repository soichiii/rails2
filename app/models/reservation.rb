class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true, date: { after_or_equal_to: Date.today }
  validates :check_out, presence: true, date: { after: :check_in }
  validates :guests, presence: true, numericality: { greater_than: 0 }

  def total_price
    (check_out - check_in).to_i * room.price
  end
end