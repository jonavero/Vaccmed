class Tutor < ApplicationRecord
has_many :dependents
  VALIDATE_DOCUMENT =['Cedula','Pasaporte']
  VALIDATE_GENDER =['Femenina','Masculino']
  validates :documentType, inclusion: {in:VALIDATE_DOCUMENT}
  validates :gender,inclusion: {in:VALIDATE_GENDER}
  validates_presence_of :name,:surname,:email,:identityCard,:documentType,:phone,:gender,:birthday,:createdBy
  validates_uniqueness_of :email,:identityCard
end
