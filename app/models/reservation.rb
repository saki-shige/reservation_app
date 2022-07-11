class Reservation < ApplicationRecord
  include CommonScope
  belongs_to :user
  belongs_to :room
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :number_of_guests, presence: true, inclusion: { in: 1..10000000 }
  validate :start_at_not_be_before_tomorrow
  validate :end_at_not_be_before_day_after_start_at
  validate :reservation_not_overlapping

  private

  def start_at_not_be_before_tomorrow
    errors.add(:start_at, 'は明日以降の日付を入力してください') if start_at.present? && (start_at <= Date.today)
  end

  def end_at_not_be_before_day_after_start_at
    errors.add(:end_at, 'は開始日の翌日以降の日付を入力してください') if end_at.present? && start_at.present? && (end_at <= start_at)
  end

  def reservation_not_overlapping
    if end_at.present? && start_at.present? && (end_at >= start_at)
      existing_reservations = Reservation.where(room_id: room_id).where('start_at <= ?', end_at).where('end_at >= ?', start_at)
      errors.add(:base, '指定の期間は既に予約が入っています。') if existing_reservations.present?
    end
  end

end
