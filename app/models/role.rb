class Role < ApplicationRecord

  validates_uniqueness_of :description,:message=> "EL valor insertado ya existe, campo unico"
  validates :description, presence: true
end
