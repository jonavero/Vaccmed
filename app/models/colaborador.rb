class Colaborador < ApplicationRecord
  belongs_to :branch_office
  belongs_to :role

  VALID_STATUS=['Active','Inactive']
  validates :status, inclusion: {in:VALID_STATUS}
  validates_presence_of :names,:surname,:status,:email,:role_id,:createBy
  validates_uniqueness_of :email, :message=> "EL valor insertado ya existe, campo unico"

end
