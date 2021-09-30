class Vaccine < ApplicationRecord
 has_many :appointments,through: :appointment_details


 alias_attribute :minAge, :edadMinima
 alias_attribute :maxAge, :edadMaxima
  validates_presence_of :name,:description,:status,:dose,:createBy,:minAge,:maxAge
  VALID_STATUS=['Active','Inactive']
  validates :status, inclusion: {in:VALID_STATUS}
  validates_uniqueness_of :name, :message=> "EL valor insertado ya existe, campo unico"


end
