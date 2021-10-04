class Dependent < ApplicationRecord
  belongs_to :patient
  belongs_to :tutor
  belongs_to :relationship

  alias_attribute :patientId, :patient_id
  alias_attribute :relationshipId, :relationship_id
  alias_attribute :tutorId, :tutor_id


  validates_presence_of :patient_id,:relationship_id,:tutor_id,:createdBy
end
