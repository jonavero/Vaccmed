class Vaccine < ApplicationRecord
 has_many :appointments,through: :appointment_details
  validates_presence_of :name,:description,:status,:dose,:typeDose,:createBy,:edadMinima,:edadMaxima
  VALID_STATUS=['Active','Inactive']
  validates :status, inclusion: {in:VALID_STATUS}
  validates_uniqueness_of :name, :message=> "EL valor insertado ya existe, campo unico"


end
