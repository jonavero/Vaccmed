class Vaccine < ApplicationRecord

  validates_presence_of :description,:status,:dose,:typeDose,:createBy,:edadMinima,:edadMaxima
  VALID_STATUS=['Active','Inactive']
  validates :status, inclusion: {in:VALID_STATUS}
  validates_uniqueness_of :name,:description, :message=> "EL valor insertado ya existe, campo unico"


end
