class Role < ApplicationRecord

  VALID_ROLE=['Collaborator','Admin','Nurse']
  validates :description, inclusion: {in:VALID_ROLE}
  validates_uniqueness_of :description,:message=> "EL valor insertado ya existe, campo unico"
  validates :description, presence: true
end
