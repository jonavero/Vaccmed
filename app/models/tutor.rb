class Tutor < ApplicationRecord
has_many :dependents
belongs_to :user
  VALIDATE_DOCUMENT =['Cedula','Pasaporte']
  VALIDATE_GENDER =['Femenino','Masculino']
  validates :documentType, inclusion: {in:VALIDATE_DOCUMENT}
  validates :gender,inclusion: {in:VALIDATE_GENDER}
  validates_presence_of :name,:surname,:email,:identityCard,:documentType,:phone,:gender,:birthday,:createdBy
  validates_uniqueness_of :identityCard, :message=> "EL valor insertado ya existe, campo unico  cedula"
validates_uniqueness_of :email, :message=> "EL valor insertado ya existe, campo unico correo "

end
