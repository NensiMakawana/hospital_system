require 'test_helper'

class AvailibilityTimeSlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @availibility_time_slot = availibility_time_slots(:one)
  end

  test "should get index" do
    get availibility_time_slots_url
    assert_response :success
  end

  test "should get new" do
    get new_availibility_time_slot_url
    assert_response :success
  end

  test "should create availibility_time_slot" do
    assert_difference('AvailibilityTimeSlot.count') do
      post availibility_time_slots_url, params: { availibility_time_slot: { doctor_id: @availibility_time_slot.doctor_id, end_time: @availibility_time_slot.end_time, start_date: @availibility_time_slot.start_date, start_time: @availibility_time_slot.start_time } }
    end

    assert_redirected_to availibility_time_slot_url(AvailibilityTimeSlot.last)
  end

  test "should show availibility_time_slot" do
    get availibility_time_slot_url(@availibility_time_slot)
    assert_response :success
  end

  test "should get edit" do
    get edit_availibility_time_slot_url(@availibility_time_slot)
    assert_response :success
  end

  test "should update availibility_time_slot" do
    patch availibility_time_slot_url(@availibility_time_slot), params: { availibility_time_slot: { doctor_id: @availibility_time_slot.doctor_id, end_time: @availibility_time_slot.end_time, start_date: @availibility_time_slot.start_date, start_time: @availibility_time_slot.start_time } }
    assert_redirected_to availibility_time_slot_url(@availibility_time_slot)
  end

  test "should destroy availibility_time_slot" do
    assert_difference('AvailibilityTimeSlot.count', -1) do
      delete availibility_time_slot_url(@availibility_time_slot)
    end

    assert_redirected_to availibility_time_slots_url
  end
end
