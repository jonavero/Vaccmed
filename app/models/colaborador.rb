class Colaborador < ApplicationRecord
  belongs_to :branch_office
  belongs_to :role
  belongs_to :user

  alias_attribute :rolId, :role_id
  alias_attribute :centroId, :rolid


  VALID_STATUS=['Active','Inactive']
  validates :status, inclusion: {in:VALID_STATUS}
  validates_presence_of :names,:surname,:status,:email,:rolId,:createBy,:centroId
  validates_uniqueness_of :email, :message=> "EL valor insertado ya existe, campo unico"

end
