class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.string :description
      t.references :availibility_time_slot, null: false, foreign_key: true
      t.date :appointment_date
      t.time :start_time
      t.time :appointment_end_time

      t.timestamps
    end
  end
end
