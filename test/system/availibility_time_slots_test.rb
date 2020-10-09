require "application_system_test_case"

class AvailibilityTimeSlotsTest < ApplicationSystemTestCase
  setup do
    @availibility_time_slot = availibility_time_slots(:one)
  end

  test "visiting the index" do
    visit availibility_time_slots_url
    assert_selector "h1", text: "Availibility Time Slots"
  end

  test "creating a Availibility time slot" do
    visit availibility_time_slots_url
    click_on "New Availibility Time Slot"

    fill_in "Doctor", with: @availibility_time_slot.doctor_id
    fill_in "End time", with: @availibility_time_slot.end_time
    fill_in "Start date", with: @availibility_time_slot.start_date
    fill_in "Start time", with: @availibility_time_slot.start_time
    click_on "Create Availibility time slot"

    assert_text "Availibility time slot was successfully created"
    click_on "Back"
  end

  test "updating a Availibility time slot" do
    visit availibility_time_slots_url
    click_on "Edit", match: :first

    fill_in "Doctor", with: @availibility_time_slot.doctor_id
    fill_in "End time", with: @availibility_time_slot.end_time
    fill_in "Start date", with: @availibility_time_slot.start_date
    fill_in "Start time", with: @availibility_time_slot.start_time
    click_on "Update Availibility time slot"

    assert_text "Availibility time slot was successfully updated"
    click_on "Back"
  end

  test "destroying a Availibility time slot" do
    visit availibility_time_slots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Availibility time slot was successfully destroyed"
  end
end
