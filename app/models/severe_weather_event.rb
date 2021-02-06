class SevereWeatherEvent < ApplicationRecord
  validates_presence_of :start_date, :end_date
  validate :overlapping_events
  validate :order_of_dates

  has_many :voucher_applications
  has_many :availabilities


  def rooms
    return 0 if availabilities.empty?
    availabilities
      .pluck(:rooms)
      .reduce(&:+)
  end

  def self.current
    past = SevereWeatherEvent.where("end_date >= ?", Date.today)
    return past.first if past.present?

    future = SevereWeatherEvent.where("start_date >= ?", Date.today)
    return future.first if future.present?
  end

  def duration
    ((end_date - start_date) + 1).to_i
  end

  private 

  def overlapping_events
    overlapping = self.class.where("start_date <= ? AND ? <= end_date", end_date, start_date)
    if overlapping.present?
      errors.add(:overlapping, "can't overlap other event: #{overlapping.first}")
    end
  end

  def order_of_dates
    if end_date < start_date
      errors.add(:end_date, "end_date: #{end_date} must be same day or later than start_date: #{start_date}")
    end
  end
end
