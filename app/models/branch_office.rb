class BranchOffice < ApplicationRecord
  has_many :colaboradors, dependent: :destroy

  alias_attribute :branchOffice, :branch_office
  VALID_STATUS=['Active','Inactive']
  validates :status, inclusion: {in:VALID_STATUS}
  validates_presence_of :name,:sector,:status,:province,:createBy
  validates_uniqueness_of :name, :message=> "EL valor insertado ya existe, campo unico"
end
