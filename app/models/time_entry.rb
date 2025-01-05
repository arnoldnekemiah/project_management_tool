class TimeEntry < ApplicationRecord
  belongs_to :task
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validates :description, presence: true

  def duration
    (end_time - start_time) / 1.hour
  end

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time <= start_time
      errors.add(:end_time, "must be after start time")
    end
  end
end
