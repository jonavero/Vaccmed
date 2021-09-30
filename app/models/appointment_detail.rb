class AppointmentDetail < ApplicationRecord
  belongs_to :appointment, optional: false
  belongs_to :vaccine

  VALID_STATUS=['Creada','Pendiente','Realizada']
  validates :status, inclusion: {in:VALID_STATUS}
end
