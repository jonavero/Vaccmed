class AddAppointmentDateToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :appointmentDate, :date
  end
end
