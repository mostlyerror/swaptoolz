class SevereWeatherEvent < ApplicationRecord
  has_many :voucher_applications

  validates_presence_of :start_date, :end_date
  validate :overlapping_events
  validate :order_of_dates

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
