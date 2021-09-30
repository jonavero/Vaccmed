class Appointment < ApplicationRecord
  belongs_to :branch_office
  belongs_to :patient
  belongs_to :tutor

  VALID_STATUS=['Creada','Pendiente','Realizada']
  validates :status, inclusion: {in:VALID_STATUS}


  has_many :appointment_details ,:dependent => :destroy
  accepts_nested_attributes_for :appointment_details,allow_destroy: true
end
