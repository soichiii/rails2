class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true, date: { after_or_equal_to: Date.today }
  validates :check_out, presence: true, date: { after: :check_in }
  validates :guests, presence: true, numericality: { greater_than: 0 }
  validate :check_out_after_check_in


  def total_price
    (check_out - check_in).to_i * room.price
  end

  def check_out_after_check_in
    return if check_in.blank? || check_out.blank?

    if check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後の日付にしてください")
    end
  end
end
