class AvailibilityTimeSlotsController < ApplicationController
  before_action :set_availibility_time_slot, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_doctor!, except: :index
  # GET /availibility_time_slots
  # GET /availibility_time_slots.json
  def index
    if current_doctor.present?
      @availibility_time_slots = current_doctor.availibility_time_slots
    else
      @availibility_time_slots = AvailibilityTimeSlot.all
    end
  end

  # GET /availibility_time_slots/1
  # GET /availibility_time_slots/1.json
  def show
  end

  # GET /availibility_time_slots/new
  def new
    @availibility_time_slot = AvailibilityTimeSlot.new
  end

  # GET /availibility_time_slots/1/edit
  def edit
  end

  # POST /availibility_time_slots
  # POST /availibility_time_slots.json
  def create
    @availibility_time_slot = AvailibilityTimeSlot.new(availibility_time_slot_params)

    respond_to do |format|
      if @availibility_time_slot.save
        format.html { redirect_to @availibility_time_slot, notice: 'Availibility time slot was successfully created.' }
        format.json { render :show, status: :created, location: @availibility_time_slot }
      else
        format.html { render :new }
        format.json { render json: @availibility_time_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availibility_time_slots/1
  # PATCH/PUT /availibility_time_slots/1.json
  def update
    respond_to do |format|
      if @availibility_time_slot.update(availibility_time_slot_params)
        format.html { redirect_to @availibility_time_slot, notice: 'Availibility time slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @availibility_time_slot }
      else
        format.html { render :edit }
        format.json { render json: @availibility_time_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availibility_time_slots/1
  # DELETE /availibility_time_slots/1.json
  def destroy
    @availibility_time_slot.destroy
    respond_to do |format|
      format.html { redirect_to availibility_time_slots_url, notice: 'Availibility time slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availibility_time_slot
      @availibility_time_slot = AvailibilityTimeSlot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def availibility_time_slot_params
      params.require(:availibility_time_slot).permit(:start_date, :end_date, :start_time, :end_time, :doctor_id)
    end
end
