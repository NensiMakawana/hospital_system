class Appointment < ApplicationRecord
  ########################Associations##################################
  belongs_to :patient
  belongs_to :doctor
  belongs_to :availibility_time_slot, optional: true
  ########################Validations##################################
  validate :valid_time_slot?, :check_available_time_slot, :end_time_must_be_after_start_time

  def valid_time_slot?
    unless (availibility_time_slot.start_date..availibility_time_slot.end_date).cover?(appointment_date) && start_time.between?(availibility_time_slot.start_time, availibility_time_slot.end_time) && appointment_end_time.between?(availibility_time_slot.start_time, availibility_time_slot.end_time)
      errors.add(:base, 'Your appointment date or time is not in selected availibility time slot.')
    end
  end

  def check_available_time_slot
    doctor.appointments.each do |appointment|
      if ((appointment.appointment_date == appointment_date) && (start_time.between?(appointment.start_time, appointment.appointment_end_time)) && (appointment_end_time.between?(appointment.start_time, appointment.appointment_end_time)))
        errors.add(:base, 'This appointment date and time already booked.')
        return
      end
    end
  end

  def end_time_must_be_after_start_time
    if start_time.present? && appointment_end_time.present? && start_time >= appointment_end_time
      errors.add(:appointment_end_time, "must be after start time")
    end
  end
end
