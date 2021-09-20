class Patient < ApplicationRecord


  VALIDATE_GENDER =['Femenina','Masculino']
  validates :gender,inclusion: {in:VALIDATE_GENDER}
  validates_presence_of :name,:surname,:gender,:birthday,:createdBy
  validates_uniqueness_of :identityCard
end
