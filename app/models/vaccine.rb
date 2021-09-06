class Vaccine < ApplicationRecord

  validates_presence_of :description,:status,:dose,:typeDose,:createBy,:edadMinima,:edadMaxima
end
