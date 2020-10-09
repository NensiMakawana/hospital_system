class AppointmentsController < ApplicationController
  before_action :authenticate_patient!, only: [:new, :create]
  before_action :extra_params, only: [:new, :create]

  def index
    if current_doctor.present?
      @appointments = current_doctor.appointments
    elsif current_patient.present?
      @appointments = current_patient.appointments
    end
  end

  def new
  	@appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointments_path, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def doctor_wise_time_slots
    doctor = Doctor.find_by(id: params[:doctor_id])
    if doctor.present?
      @availibility_time_slots = doctor.availibility_time_slots
    else
      @availibility_time_slots = []
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :description, :availibility_time_slot_id, :appointment_date, :start_time, :appointment_end_time)
  end

  def extra_params
    @doctors = Doctor.all
    @patients = Patient.all
    @availibility_time_slots = AvailibilityTimeSlot.all
  end
end