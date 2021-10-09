class Appointment < ApplicationRecord
  belongs_to :branch_office
  belongs_to :patient
  belongs_to :tutor

  VALID_STATUS=['Creada','Pendiente','Realizada','En proceso']
  validates :status, inclusion: {in:VALID_STATUS}

  alias_attribute :patientId, :patient_id
  alias_attribute :tutorId, :tutor_id
  alias_attribute :branchOfficeId, :branch_office_id
  alias_attribute :vaccineId, :vaccine_id

  alias_attribute :appointmentDetailsAttributes, :appointment_details_attributes


  has_many :appointment_details ,:dependent => :destroy
  accepts_nested_attributes_for :appointment_details,allow_destroy: true
end
