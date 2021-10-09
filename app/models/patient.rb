class Patient < ApplicationRecord
  has_many :dependents
  VALIDATE_GENDER =['Femenino','Masculino']
  validates :gender,inclusion: {in:VALIDATE_GENDER}
  validates_presence_of :name,:surname,:gender,:birthday,:createdBy
end
