class SevereWeatherEvent < ApplicationRecord
  has_many :voucher_applications
  validates_presence_of :start_date, :end_date

  validate :no_overlapping_events

  private 

  def no_overlapping_events
    overlapping = self.class.where("start_date <= ? AND ? <= end_date", end_date, start_date)
    if overlapping.present?
      errors.add(:overlapping, "can't overlap other event: #{overlapping.first}")
    end
  end

  def overlaps?(other)
    start_date <= other.end_date && other.start_date <= end_date
  end
end
