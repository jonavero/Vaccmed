class BranchOffice < ApplicationRecord
  has_many :colaboradors, dependent: :destroy

  validates_presence_of :name,:sector,:state,:province,:createBy
  validates_uniqueness_of :name, :message=> "EL valor insertado ya existe, campo unico"
end
