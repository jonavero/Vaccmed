class CreateAppointmentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :appointment_details do |t|
      t.references :appointments, null: false, foreign_key: true
      t.references :vaccine, null: false, foreign_key: true
      t.string :status
      t.string :createdBy

      t.timestamps
    end
  end
end
