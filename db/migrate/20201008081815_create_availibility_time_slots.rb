class CreateAvailibilityTimeSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :availibility_time_slots do |t|
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
