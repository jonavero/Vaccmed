class Dependent < ApplicationRecord
  belongs_to :patient
  belongs_to :tutor
  belongs_to :relationship

  validates_presence_of :patient_id,:relationship_id,:tutor_id,:createdBy
end
