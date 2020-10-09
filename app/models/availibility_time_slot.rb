class AvailibilityTimeSlot < ApplicationRecord
  ########################Associations##################################
  belongs_to :doctor
  has_many :appointments
  ########################Validations##################################
  validate :end_time_must_be_after_start_time, :end_date_must_be_after_start_date
  validates_presence_of :start_time, :end_time

  def end_time_must_be_after_start_time
    if start_time.present? && end_time.present? && start_time >= end_time
      errors.add(:end_time, "must be after start time")
    end
  end

  def end_date_must_be_after_start_date
  	if start_date > end_date
      errors.add(:end_date, "must be after start date")
    end
  end
end
