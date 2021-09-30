class AddNurseNameToAppointmentDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :appointment_details, :nurseName, :string,default: 'none'
  end
end
